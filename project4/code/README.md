
# [COP5615] DOSP Project 4 Twitter-Engine

## Team Members
- Zhaoyang Chen (UFID: 90137235)




## Test and Simulation
#### Workload Generation
```
TEST 1
6> workload_simulator:start().
"Load test for: single_actor"
"Statistics for: Generating users and their subscriptions"
"Runtime / WallClock"
"0.0000.003"
"Load Generation Setup: NumberOfUsers, Subscriptions, ActionCount"
"Actions executed by type"
10
2
2
"Statistics for: Sending Tweets (tweet)"
"Runtime / WallClock"
"0.0020.002"
"Statistics for: Reading own Timeline (get_timeline)"
"Runtime / WallClock"
"0.0000.001"
"Statistics for: Reading Tweets from Other Users (get_tweets)"
"Runtime / WallClock"
"0.0000.002"
"Finished"


TEST 2
9> workload_simulator:start().
"Load test for: single_actor"
"Statistics for: Generating users and their subscriptions"
"Runtime / WallClock"
"0.129 0.132"
"Load Generation Setup: NumberOfUsers, Subscriptions, ActionCount"
"Actions executed by type"
100
20
20
"Statistics for: Sending Tweets (tweet)"
"Runtime / WallClock"
"0.156 0.157"
"Statistics for: Reading own Timeline (get_timeline)"
"Runtime / WallClock"
"0.420 0.464"
"Statistics for: Reading Tweets from Other Users (get_tweets)"
"Runtime / WallClock"
"0.185 0.321"
"Finished"


TEST 3
2> workload_simulator:start().
"Load test for: single_actor"
"Statistics for: Generating users and their subscriptions"
"Runtime / WallClock"
"2.688 1.394"
"Load Generation Setup: NumberOfUsers, Subscriptions, ActionCount"
"Actions executed by type"
500
50
25
"Statistics for: Sending Tweets (tweet)"
"Runtime / WallClock"
"2.181 1.995"
"Statistics for: Reading own Timeline (get_timeline)"
"Runtime / WallClock"
"10.811 8.788"
"Statistics for: Reading Tweets from Other Users (get_tweets)"
"Runtime / WallClock"
"2.563 2.552"
"Finished"


Test 4
5> workload_simulator:start().
"Load test for: single_actor"
"Statistics for: Generating users and their subscriptions"
"Runtime / WallClock"
"21.725 8.418"
"Load Generation Setup: NumberOfUsers, Subscriptions, ActionCount"
"Actions executed by type"
1000
100
50
"Statistics for: Sending Tweets (tweet)"
"Runtime / WallClock"
"16.613 9.093"
"Statistics for: Reading own Timeline (get_timeline)"
"Runtime / WallClock"
"183.473 176.561"
"Statistics for: Reading Tweets from Other Users (get_tweets)"
"Runtime / WallClock"
"28.765 28.885"
"Finished"

```
#### Benchmark Test
```
TWEET
16> benchmark:test_tweet().
Running benchmark tweet: 1
CPU time = 6135 ms
Wall clock time = 2027 ms
tweet done
Running benchmark tweet: 2
CPU time = 6179 ms
Wall clock time = 2025 ms
tweet done
Running benchmark tweet: 3
CPU time = 6756 ms
Wall clock time = 2220 ms
tweet done
Running benchmark tweet: 4
CPU time = 6656 ms
Wall clock time = 2184 ms
tweet done
Running benchmark tweet: 5
CPU time = 5643 ms
Wall clock time = 1821 ms
tweet done
ok

GET_TWEETS
18> benchmark:test_get_tweets().
Running benchmark get_tweets: 1
CPU time = 630 ms
Wall clock time = 338 ms
get_tweets done
Running benchmark get_tweets: 2
CPU time = 724 ms
Wall clock time = 373 ms
get_tweets done
Running benchmark get_tweets: 3
CPU time = 608 ms
Wall clock time = 315 ms
get_tweets done
Running benchmark get_tweets: 4
CPU time = 483 ms
Wall clock time = 300 ms
get_tweets done
Running benchmark get_tweets: 5
CPU time = 81 ms
Wall clock time = 160 ms
get_tweets done
ok

GET_TIEMLINE
20> benchmark:test_get_timeline().
Running benchmark get_timeline: 1
CPU time = 1382 ms
Wall clock time = 927 ms
get_timeline done
Running benchmark get_timeline: 2
CPU time = 1320 ms
Wall clock time = 855 ms
get_timeline done
Running benchmark get_timeline: 3
CPU time = 884 ms
Wall clock time = 658 ms
get_timeline done
Running benchmark get_timeline: 4
CPU time = 598 ms
Wall clock time = 694 ms
get_timeline done
Running benchmark get_timeline: 5
CPU time = 521 ms
Wall clock time = 620 ms
get_timeline done
ok


```

## 


