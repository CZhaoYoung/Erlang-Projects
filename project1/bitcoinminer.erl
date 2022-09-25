-module(bitcoinminer).
-export([caclulate/0, worker/2]).


worker(info, K) ->
    Name = get_random_string(),

    BitcoinStr = encode(Name),
    
    % slice the substing from 1 to K 
    KSubString = string:substr(BitcoinStr,1,K),
    % zeros with K lenth
    Check = lists:concat(lists:duplicate(K, "0")),

    if 
        KSubString =:= Check ->
            try
               info ! {Name, BitcoinStr}
            catch
                error:badarg -> exit(self(),kill)
            end;
        true ->
            worker(info, K)
    end.


caclulate() ->
    receive
        {Name, BitcoinStr} ->

            io:format("Code: ~s\t \t",[Name]),
            io:format("HashCode: ~s\n",[BitcoinStr]),
            {_,Time} = statistics(runtime),
            {_,Time2} = statistics(wall_clock),
            timer:sleep(2000),
            CPU_time = Time / 1000,
            Run_time = Time2 / 1000,
            Time3 = CPU_time / Run_time,
            io:format("CPU time: ~p seconds\t", [CPU_time]),
            io:format("Real time: ~p seconds\n", [Run_time]),
            io:format("Ratio is ~p \n", [Time3])
            % exit(self(),kill)

    end.


get_random_string() ->
    Random_Str = string:concat("czy",
        base64:encode_to_string(crypto:strong_rand_bytes(9))),
    Random_Str.

hashit(String)->
    <<Integer:256>> = crypto:hash(sha256, String),
    Integer.

encode(String)->
    HexStr = string:right(integer_to_list(hashit(String),16),64,$0),
    string:to_lower(HexStr).