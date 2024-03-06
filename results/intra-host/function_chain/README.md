Function Chain
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


Measure the latency of FunctionChain with different chain lengths and payload sizes.
```shell

# step 1, setup Pheromone along with FunctionChain application
bash ./start_all.sh

# step 2, invoke
bash ./invoke_latency.sh

# step 3, stop all processes
bash ./stop_all.sh

```

Access the log files located in "/tmp/sp00" and review the results in the executor log files as provided below:
```shell
chain_length = 2, payload_size = 512, token 2003 us.
chain_length = 2, payload_size = 512, token 455 us.
chain_length = 16, payload_size = 512, token 2919 us.
chain_length = 16, payload_size = 512, token 2936 us.
chain_length = 32, payload_size = 512, token 4694 us.
chain_length = 32, payload_size = 512, token 4901 us.
chain_length = 64, payload_size = 512, token 8577 us.
...
```

### How to measure throughput?






### How to measure resource consumption?

