
# [COP5615] DOSP Project 2 Gossip Algorithm

## Team Members
- Zhaoyang Chen (UFID: 90137235)

## Implementation
The program implements the following two group communication/aggregation algorithms
* Asynchronous Gossip
* Push Sum

Topologies mentioned below:
* **Full Network:** Every actor is a neighbor of all other actors. That is, every
actor can talk directly to any other actor.
* **Line:** Actors are arranged in a line. Each actor has only 2 neighbors (one
left and one right, unless you are the first or last actor).
* **2D Grid:** Actors form a 2D grid. The actors can only talk to the grid
neighbors.
* **Imperfect 3D Grid:** Grid arrangement but one random other neighbor is selected from the list of all actors (8+1 neighbors).




## The largest network reached


The following table depits the performace measure for the given number of workers (Number of group * 4):
|     |   Full  | Imperfect 3D |    2D   |   Line  |
|:--------:|:-------:|:------------:|:-------:|:-------:|
|  Gossip  | 1000 |    4096   | 4096 | 1000 |
| Push-sum | 1000 |    1024   | 1024 |   1000   |
|          |         |              |         |         |



## How to run the program
Input:
1. NumNodes. number of actor nodes involved in the network. 
2. Topology.   
	"Full" - Full Network  
	"Line" - Line Network  
	"2D" - 2D Grid Network  
	"Imp3D" - Imperfect 3D Grid Network  
3. Algorithm.  
	"Gossip" - Asynchronous Gossip
	"Push" - Push Sum
4. Some running examples
```
27> main:run(100, "Line", "Gossip").
Actors 100, Topology "Line", Algorithms "Gossip" 
creating neighbours for actors 100  and Topology is "Line" 
Finished        ok
Start Time 1665446738604        End Time 1665446740570 
Convergence time is 1966 milliseconds 

28> main:run(20, "Line", "Push").
Actors 20, Topology "Line", Algorithms "Push" 
creating neighbours for actors 20  and Topology is "Line" 
Finished        ok
Start Time 1665446944348        End Time 1665446944446 
Convergence time is 98 milliseconds  

29> main:run(25, "Imp3D", "Push").
Actors 25, Topology "Imp3D", Algorithms "Push" 
creating neighbours for actors 25  and Topology is "Imp3D" 
Finished        ok
Start Time 1665447111754        End Time 1665447112311 
Convergence time is 557 milliseconds  
```

## Running Time

**Gossip**

|Network| Size | Running Time (milliseconds) |
|--|----------|----------------------------------|
|Line | 16        | 3                            |
| | 100        | 118                               |
| | 900     |    > 60000         |       
|2D | 16        |   3                             |
| | 100       |   73                             |
| | 900       |   20797                           |
| | 1024       |  21741               |
|Full | 16       |    2                         |
| | 100       | 754                               |
| | 900       |  > 60000                        |
|Imp3D | 16       |    2                          |
| | 100       | 52                               |
| | 900       | 7258                              | 
| | 1024       |13078                          | 




**Push Sum**

|Network| Size | Running Time (milliseconds) |
|--|----------|----------------------------------|
|Line | 16        | 16                            |
| | 100      | 6240                               |
| | 900     |    > 60000         |       
|2D | 16        |   84                             |
| | 100       |   21607                          |
| | 900       |   > 60000                         |
| | 1024       |  > 60000             |
|Full | 16       |    156                         |
| | 100       | 754                               |
| | 900       |  > 60000                        |
|Imp3D | 16       |    62                          |
| | 100       | 31607                            |
| | 900       | > 60000                          | 
| | 1024       | > 60000                        | 