-module(boss).
-export([start/2]).

-import(bitcoinminer,[caclulate/0,worker/2]).

start(K, Workers) ->
    register(info, spawn(bitcoinminer,caclulate,[])),
    statistics(runtime),
    statistics(wall_clock),
    Times = erlang:system_info(logical_processors)*Workers,

    io:format("num of group are ~w~n", [Workers]),
    io:format("workers generated ~w~n", [Times]),
    spawn_processes(info, K, Times).



spawn_processes(info, K, Times) ->
    if 
        Times > 0 ->
            spawn(bitcoinminer, worker, [info, K]),
            spawn_processes(info, K, Times-1);
        true ->
            io:format("")
    end.

