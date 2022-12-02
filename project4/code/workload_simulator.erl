%%
%% Zhaoyang Chen
%% 
%% generates some workload for the twitter application based on
%% single_actor and server
%%


-module(workload_simulator).


-export([start/0, generate_users/2, generate_subscriptions/3, action_tweet/1,
	action_get_tweets/2, action_get_timeline/1]).


%%
%% APIs
%%

start() -> start_server_single_actor().


start_server_single_actor() ->
	erlang:display("Load test for: single_actor"),
	start(fun single_actor:initialize/0,
	fun single_actor:register_user/0,
	fun single_actor:subscribe/3).

%% generic start method
start(Initializer, Registrar, Subscriber) ->

	% call the initialize() method for the configuration we want to test 
	Initializer(),
	
	% initialize statistics: put this anywhere you want to start measuring
	statistics(runtime),
	statistics(wall_clock),

	% user configuration
	% UserType = {NumberOfUsers, Subscriptions, ActionCount}
	% NumberOfUsers : number of users to be created
	% Subscriptions : number of followers for each user
	% ActionCount   : how many times each action (tweet, get_tweets, get_timeline)
	%                 is repeated for each user
	UserType = {1000, 100, 50},
	
	% generate users, result is a list of {UserId, Pid}
	Users = generate_users(UserType, Registrar),

	% generate subscriptions
	generate_subscriptions(Users, UserType, Subscriber),
	print_statistics("Statistics for: Generating users and their subscriptions"),
	
	% execute the other actions: by action type, or interleaved
	execute_actions(Users, UserType),
	% execute_actions_interleaved(Users, UserType),

	erlang:display("Finished").

% generates the clients as specified in your "register_user" function
generate_users(UserType, Registrar) ->
	{NumberOfUsers, _Subscriptions, _ActionCount} = UserType,
	UsersToCreate = lists:duplicate(NumberOfUsers, []),
	lists:map(fun(_User) -> Registrar() end, UsersToCreate).
	
% generates the requested number of subscriptions per user, on a random basis
generate_subscriptions(Users, UserType, Subscriber) ->
	{NumberOfUsers, Subscriptions, _ActionCount} = UserType,
	{A1,A2,A3} = now(),
    random:seed(A1, A2, A3),
	lists:foreach(fun(User) -> 
					{UserId, UserPid} = User,
					UsersToConnectTo = lists:sublist(Users, random:uniform(NumberOfUsers - Subscriptions), Subscriptions),
					UserIdsToConnectTo = lists:map(fun({UserId2, _UserPid2}) -> UserId2 end, UsersToConnectTo),
					% now connect to each of the requested subscriptions
					lists:foreach(fun(UserId2) ->
									Subscriber(UserPid, UserId, UserId2)
									end,
									UserIdsToConnectTo)
					end,
					Users).
	
% execute the actions by type: first all tweets, then get_timeline, then get_tweets
% statistics are printed after each action
execute_actions(Users, UserType) ->
	{NumberOfUsers, Subscriptions, ActionCount} = UserType,
	ActionList = lists:duplicate(ActionCount, []),

	% statistics header
	erlang:display("Load Generation Setup: NumberOfUsers, Subscriptions, ActionCount"),
	erlang:display("Actions executed by type"),
	erlang:display(NumberOfUsers),
	erlang:display(Subscriptions),
	erlang:display(ActionCount),


	% by types
	% send all tweets
	lists:foreach(fun(_Counter) -> action_tweet(Users) end, ActionList),
	print_statistics("Statistics for: Sending Tweets (tweet)"),

	% read timeline
	lists:foreach(fun(_Counter) -> action_get_timeline(Users) end, ActionList),
	print_statistics("Statistics for: Reading own Timeline (get_timeline)"),
	
	% read tweets from other users
	lists:foreach(fun(_Counter) -> action_get_tweets(Users, NumberOfUsers) end, ActionList),
	print_statistics("Statistics for: Reading Tweets from Other Users (get_tweets)").


	% in an interleaved way
	% statistics are only printed at the end
	% lists:foreach(fun(_Counter) ->
	% 					action_tweet(Users),
	% 					action_get_tweets(Users, NumberOfUsers),
	% 					action_get_timeline(Users)
	% 					end,
	% 					ActionList),
	% print_statistics("Statistics for: interleaved actions").
		
% executes a single tweet action for all users
action_tweet(Users) ->
	lists:foreach(fun({UserId, UserPid}) -> 
					 server:tweet(UserPid, UserId, get_random_tweet_text())
%					 server:tweet(UserPid, UserId, "hello world")
					 end,
					 Users).

% executes a single get_tweets action for all users
action_get_tweets(Users, NumberOfUsers) ->
	{A1,A2,A3} = now(),
    random:seed(A1, A2, A3),
	lists:foreach(fun({_UserId, UserPid}) -> 
					 server:get_tweets(UserPid, random:uniform(NumberOfUsers-1), 0)
					 end,
					 Users).
					 
% executes a single get_timeline action for all users
action_get_timeline(Users) ->
	lists:foreach(fun({UserId, UserPid}) -> 
					 server:get_timeline(UserPid, UserId, 0)
					 end,
					 Users).
					 
% prints statistics in a very rudimentary way
print_statistics(Title) ->
	erlang:display(Title),
	{_, RunTime} = statistics(runtime),
	{_, WallClock} = statistics(wall_clock),
	Time1 = io_lib:format("~.3f",[RunTime / 1000.0]),
	Time2 = io_lib:format("~.3f",[WallClock / 1000.0]),

	erlang:display("Runtime / WallClock"),
	erlang:display(Time1 ++" "++ Time2).
	
% creates and returns a tweet by randomly selecting some words from predefined lists
get_random_tweet_text() ->
	{A1,A2,A3} = now(),
    random:seed(A1, A2, A3),
	ExclamationWords = ["Oh my God!", "Check this out:", "Can't believe this:", "WTF?!?", "Already heard something like this before?"],
	Exclamation = get_random_word(ExclamationWords),
	SubjectWords = ["@John", "@Francis", "Alice", "Fliex", "Chris"],
	Subject = get_random_word(SubjectWords),
	VerbWords = ["stole", "has lost", "forgot", "won", "has bought"],
	Verb = get_random_word(VerbWords),
	ObjectWords = ["#Mercedes", "a new watch", "tickets for Madonna's concert", "a house", "#four dogs"],
	Object = get_random_word(ObjectWords),
	WhereWords = ["in the city centre", "at school", "while sitting in the garden", "at work", "on the bus"],
	Where = get_random_word(WhereWords),
	WhenWords = ["after work.", "this morning.", "more than a week ago.", "without telling anyone.", "during lunchtime."],
	When = get_random_word(WhenWords),
	string:join([Exclamation, Subject, Verb, Object, Where, When], " ").

% Randomly selects one word out of a list of 5 words
get_random_word(List) ->
	lists:nth(random:uniform(length(List)), List).