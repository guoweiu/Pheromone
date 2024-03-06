FINRA
---

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

## How to measure latency?

```shell

# step 1
bash ./start_all.sh

# step 2
bash ./invoke_latency.sh

# step 3
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

## How to measure throughput?


```shell

# step 1
bash ./start_all.sh

# step 2
bash ./invoke_throughput.sh

# step 3
bash ./stop_all.sh

```




## How to measure resource consumption?

```shell

# step 1
bash ./start_all.sh

# step 2
bash ./invoke_throuphput.sh


top -bn 10 | grep -E 'PID'


# step 3
bash ./stop_all.sh

```