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

**Challenge:**

The asynchronous invocation pattern of Pheromone poses difficulties in accurately measuring its throughput.
Moreover, calling applications atop Pheromone requires a specialized client,
as direct usage of tools like wrk2 is not feasible.

**Solution:**

To address these challenges,
we have implemented a C++ Pheromone client, available in [pheromone_client.h](https://github.com/guoweiu/Fuyao-benchmarks/blob/master/Experiments/09/include/pheromone_client.h).
Concurrently, we have developed functions atop Fuyao to serve as Pheromone's load generator.
Specifically, the start function is responsible for forwarding requests from wrk2.
Upon completion, users can collect comprehensive completion statistics from log files,
enabling them to effectively determine throughput. 

**How to do?**


- First, start Pheromone
```shell
# Start Pheromone in node-129
bash ./start_all.sh
```

- Then, start Fuyao and Loadgen:
```shell

# Navigate to a corresponding directory
cd ~/Fuyao-benchmarks/Experiments/bench/pheromone_loadgen/

# Build Fuyao and Loadgen
bash ./build_all.sh

# Start Loadgen in node-126 while Pheromone remains in node-129
bash ./start_all.sh

# Set the QPS (Queries Per Second) to 100
bash invoke_chain.sh 100

# Stop Fuyao and Loadgen
bash ./stop_all.sh

# Go back Pheromone
cd ~/Pheromone/results/intra-host/function_chain

# Stop Pheromone and Function Chain
bvash stop_all.sh
```



- Finally, Gathering Completion Statistics:

Users should collect completion statistics from log files 
located in /tmp/sp00/ to determine throughput.

The results in log files like:
```shell
chain_length = 16, payload_size = 512, token 36824 us.
chain_length = 16, payload_size = 512, token 29896 us.
chain_length = 16, payload_size = 512, token 33771 us.
chain_length = 16, payload_size = 512, token 27832 us.
chain_length = 16, payload_size = 512, token 35711 us.
chain_length = 16, payload_size = 512, token 34619 us.
chain_length = 16, payload_size = 512, token 34166 us.
chain_length = 16, payload_size = 512, token 7648 us.
chain_length = 16, payload_size = 512, token 23304 us.
chain_length = 16, payload_size = 512, token 25772 us.
...
```
