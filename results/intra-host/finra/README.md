FINRA
---

> If errors happen during building or evaluation, double-check IP addresses and source project paths in the scripts.

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


Measure the latency of FINRA with a fan-out degree set to 10.
(If measuring latency under different fan-out degrees, 
simply repeat the process with varying fan-out degree values.)
```shell

# step 1, setup Pheromone along with FINRA application
bash ./start_all.sh 10

# step 2, invoke with the argument set to 10.
bash ./invoke_latency.sh 10

# step 3, stop all processes
bash ./stop_all.sh

```

Access the log files located in "/tmp/sp06" and review the results in the executor log files as provided below:
```shell
req_id = 100000, token 8122 us.
req_id = 100000, token 5043 us.
req_id = 100000, token 4520 us.
req_id = 100000, token 16741 us.
req_id = 100000, token 34239 us.
```

### How to measure throughput?

Please reference Function Chain.

