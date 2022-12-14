-module(gossip).

%% API
-export([spawn_actors/1, pass_message_to_neighbours / 0, index_of/2]).



spawn_actors(Counter)->
  receive {"Gossip_Message", Index, NeighbourList, ActorList, Parent} ->
    Parent,
    if
      Counter == 0 ->
        % io:format("Convergence achieved for ~p ~n", [self()]),
        convergence ! {"Actor Finished Work", self()},
        pass_message_to_neighbours ! {"Can't acknowledge any more messages", "Dead", Parent, ActorList, NeighbourList, self()},
        exit(normal);
      true ->
        pass_message_to_neighbours ! {Index, NeighbourList, ActorList, self()},
        spawn_actors(Counter - 1)
    end
  end.



pass_message_to_neighbours() ->
  receive
    {Index, NeighbourList, ActorList, PID} ->

      Neighbours = lists:nth(Index, NeighbourList),
      Len = length(Neighbours),
      Rand_index = rand:uniform(Len),
      Neighbour_Pid = lists:nth(Rand_index, Neighbours),
      Is_Alive = is_process_alive(Neighbour_Pid),
      if
        Is_Alive == false ->
           % io:format("Dead Neighbour ~p for PId  ~p ~n", [Neighbour_Pid, PID]),
          self() ! {Index, NeighbourList, ActorList, PID},
          pass_message_to_neighbours();
        true ->
          % io:format("Triggering"),
          Neighbour_Pid ! {"Gossip_Message", index_of(Neighbour_Pid, ActorList), NeighbourList, ActorList, PID},
          self() ! {Index, NeighbourList, ActorList, PID},
          pass_message_to_neighbours()
      end;

    {"Can't acknowledge any more messages", State , PID, ActorList, NeighbourList, Neighbour_Pid} ->
      State, Neighbour_Pid,
      self() ! {index_of(PID, ActorList), NeighbourList, ActorList, PID},
      pass_message_to_neighbours()

  end.


index_of(Item, List) -> index_of(Item, List, 1).
index_of(_, [], _)  -> not_found;
index_of(Item, [Item|_], Index) -> Index;
index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).