Transfer data
---

> If errors happen during building or evaluation, double-check IP addresses and source project paths in the scripts.

## Build

```shell
bash ./build_all.sh
```

The outputs resemble the following:
```shell
...
[100%] Linking CXX executable exp00_register
[100%] Built target exp00_register
```

## Evaluation

### How to measure latency?


Measure the transfer latency, which measures the time elapsed 
between the upstream function sending the data and the downstream function receiving it.
```shell

# step 1, setup Pheromone
bash ./start_all.sh

# step 2, invoke with the argument set to 10.
bash ./invoke_latency.sh

# step 3, stop all processes
bash ./stop_all.sh

```

Access the log files located in "/tmp/sp01" and review the results in the executor log files as provided below:
```shell
transfer payload, size = 255, token 547
transfer payload, size = 255, token 198
transfer payload, size = 255, token 184
transfer payload, size = 511, token 285
transfer payload, size = 511, token 178
...
```

### How to measure throughput?






### How to measure resource consumption?

