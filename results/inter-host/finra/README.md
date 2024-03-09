FINRA
---

> If errors happen during building or evaluation, double-check IP addresses and source project paths in the scripts.

Users can evaluate the performance of FINRA across nodes. 
In our environment, we utilize a cluster consisting of two nodes, 
with IP addresses "192.168.1.129" and "192.168.1.126", respectively. 


## Build

```shell
bash ./build_all.sh
```

The outputs resemble the following:
```shell
...
[100%] Linking CXX shared library /tmp/shm/exp06_marginbalance.so
[100%] Built target exp06_marginbalance
[  0%] Linking CXX shared library /tmp/shm/exp06_marketdata.so
[100%] Built target exp06_marketdata
[  3%] Built target fmt
[ 11%] Built target shm-ipc
[ 30%] Built target yaml-cpp
[ 96%] Built target objects
[ 96%] Built target libzmq
[100%] Built target exp06_register
Linking CXX shared library /tmp/shm/exp06_run_audit.so
Built target exp06_run_audit
```

## Evaluation

### How to measure latency?

- Measure the latency of FINRA with a fan-out degree set to 10.
(If measuring latency under different fan-out degrees,
simply repeat the process with varying fan-out degree values.)

- Comparing cases within a single node is straightforward, 
but measuring latency across nodes becomes more complex. This complexity arises from Pheromone's asynchronous invocation pattern and differences in system clocks between nodes.

- Consequently, we have developed an application based on Fuyao to act as Pheromone's load generator. 
This application, located at **Fuyao-benchmarks/Experiments/09**, 
primarily consists of two functions: the `start_finra` function and the `end` function.

- Each time a request is forwarded to Pheromone via Fuyao, 
the `start_finra` function records the start timestamp, 
and the `end` function records the end timestamp. 
Note that, we deploy the application within a single node, 
eliminating errors caused by differences in system clocks across nodes.


  