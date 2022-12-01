%%
%% Zhaoyang Chen
%% 

-module(benchmark).

-export([test_tweet/0, test_get_tweets/0, test_get_timeline/0]).


%% Benchmark helpers
run_benchmark(Name, Fun, Times) ->
    lists:foreach(fun (N) -> run_benchmark_once(Name, Fun, N) end, lists:seq(1, Times)).

run_benchmark_once(Name, Fun, N) ->
    io:format("Running benchmark ~s: ~p~n", [Name, N]),

    % Start timers
    statistics(runtime),    % CPU time, summed for all threads
    statistics(wall_clock), % Real (wall clock) time

    % Run
    Fun(),

    % Get and print statistics
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    io:format("CPU time = ~p ms~nWall clock time = ~p ms~n", [Time1, Time2]),
    io:format("~s done~n", [Name]).


%% Benchmarks
load_generation_setup() ->
    single_actor:initialize(),
    NumbersOfUsers = 5000,
    UserType = {NumbersOfUsers, 10, 100},
    Users = workload:generate_users(UserType,
        fun single_actor:register_user/0),
    workload:generate_subscriptions(Users, UserType,
        fun single_actor:subscribe/3),
    {Users, NumbersOfUsers}.

test_tweet() ->
    {Users, _} = load_generation_setup(),
    run_benchmark("tweet",
        fun () -> workload:action_tweet(Users) end,
        50).

test_get_tweets() ->
    {Users, NumbersOfUsers} = load_generation_setup(),
    run_benchmark("get_tweets",
        fun () -> workload:action_get_tweets(Users, NumbersOfUsers) end,
        50).

test_get_timeline() ->
    {Users, _} = load_generation_setup(),
    run_benchmark("get_timeline",
        fun () -> workload:action_get_timeline(Users) end,
        50).
