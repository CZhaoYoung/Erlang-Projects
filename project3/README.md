
# [COP5615] DOSP Project 3 Chord

## Team Members
- Zhaoyang Chen (UFID: 90137235)

## Implementation
In this project, I implemented the Tapestry peer-to-peer service deployment infrastructure, which supports dynamic node join and exit. I simulate network nodes using actors in Erlang and assign random positions to each node to better simulate real-world scenarios.

The project has the following four parts:
* Key. Generate random hash keys
* Node. Implement methods such as the addition to the ring, looking up, and notification(a new node informs us of its existence).
* Storage. storage of the keys and value of certain nodes.
* Test. Test the validation of the P2P network, as well as count the Hops of each request. 







## How to run the program
Input:
1. Num. The number of actor nodes involved in the network. 
2. NumRequests.  The number of requests each peer has to make
3. Some running examples
```
4> test:build(100).

 Pid = <0.294.0> 
<0.294.0>
5> test:countHops(10,<0.293.0>).

 Hops = 2 

 Hops = 2 

 Hops = 2 

 Hops = 1 

 Hops = 2 

 Hops = 2 

 Hops = 2 

 Hops = 2 

 Hops = 2 

 Hops = 2 
ok

```

## 
In the actual test, I found that there are some bugs in passing the PID of the node, so to complete the project at the scheduled time. I split the two parameters num and numrequests and pass them. In the actual test, the number of nodes can reach more than 10,000, and the test of the request is in the order of thousands.

