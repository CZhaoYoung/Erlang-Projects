
-module(test).

-compile([export_all]).

-define(Timeout, 1000).
%%
%% API Functions
%%


build(Num) ->
    build(Num-1, node:start(key:generate())).

build(Num, Node) when Num > 0 ->
    NextNode = node:start(key:generate(), Node),
    % io:format("~n Pid = ~p ~n",[Node]),
    build(Num-1, NextNode);

build(Num, Node) when Num == 0 ->
    
    io:format("~n Pid = ~p ~n",[Node]),
    Node.


countHops(NumRequests, Node) when NumRequests > 0 ->

    Key = key:generate(),
    add(Key, "test", Node),
    lookup(Key, Node),
    countHops(NumRequests-1, Node);

countHops(NumRequests, Node) when NumRequests == 0 ->
    ok.


add(Key, Value , P) ->
    Q = make_ref(),
    P ! {add, Key, Value, Q, self()},
    receive 
  {Q, ok} ->
     ok
  after ?Timeout ->
      {error, "timeout"}
    end.

lookup(Key, Node) ->
    Q = make_ref(),
    Node ! {lookup, Key, Q, self(),1},
    receive 
  {Q, Value, Hops} ->
      Value,
      Hops
    after ?Timeout ->
      {error, "timeout"}
    end.











    

