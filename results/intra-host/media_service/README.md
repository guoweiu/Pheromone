Media Service
---

## Build and start Pheromone and Media Service
```shell
bash ./build_all.sh

bash ./start_all.sh
```

Outputs:
```shell
app exp02 registered
app exp02_register registered
register finished!
```

## Invoke Pheromone

**Challenge:**

The asynchronous invocation pattern of Pheromone poses difficulties in accurately measuring its throughput.
Moreover, calling applications atop Pheromone requires a specialized client,
as direct usage of tools like wrk2 is not feasible.

**Solution:**

To address these challenges,
we have implemented a C++ Pheromone client, available in [pheromone_client.h](https://github.com/guoweiu/Fuyao-benchmarks/blob/master/Experiments/09/include/pheromone_client.h).
Concurrently, we have developed functions atop Fuyao to serve as Pheromone's load generator.
Specifically, the start function forwards requests from wrk2.

**How to do?**

- start Fuyao and Loadgen:

```shell

# Navigate to a corresponding directory
cd ~/Fuyao-benchmarks/Experiments/bench/pheromone_loadgen/

# Build Fuyao and Loadgen
bash ./build_all.sh

# Start Loadgen in node-126 while Pheromone remains in node-129
bash ./start_all.sh

# Set the QPS (Queries Per Second) to 100
bash invoke_media.sh 100

# Stop Fuyao and Loadgen
bash ./stop_all.sh

# Go back Pheromone
cd ~/Pheromone/results/intra-host/function_chain

# Stop Pheromone and Function Chain
bvash stop_all.sh
```

- Finally, Gathering Completion Statistics:

Users should collect completion statistics from log files
located in /tmp/sp02/ to determine throughput.

Results in log files:
```shell
I Get movie_id 34480, cache hit from memcached
UploadMovieId1 finished!, token 1528
UploadRating3 finished!, token 197
I Get movie_id 233063, cache hit from memcached
UploadMovieId1 finished!, token 1567
I Get movie_id 375315, cache hit from memcached
UploadMovieId1 finished!, token 1067
UploadMovieId3 finished!, token 186
UploadRating3 finished!, token 130
UploadRating3 finished!, token 150
I Get movie_id 310, cache hit from memcached
UploadMovieId1 finished!, token 1166
UploadRating3 finished!, token 123
I Get movie_id 194662, cache hit from memcached
UploadMovieId1 finished!, token 1098
I Get movie_id 51241, cache hit from memcached
UploadMovieId1 finished!, token 1187
UploadMovieId3 finished!, token 192
UploadRating3 finished!, token 174
I Get movie_id 9516, cache hit from memcached
...
```

A single line containing "StoreReview4 finished!" signals a completion event.