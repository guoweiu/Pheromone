Pheromone
---

We use CMake to reorganize the original [Pheromone project](https://github.com/MincYu/pheromone) and port benchmarks for Pheromone.

## Install dependencies

```shell
sudo apt-get install libyaml-cpp-dev
sudo apt-get install libprotobuf-dev protobuf-compiler
sudo apt-get install -y libzstd-dev libssl-dev libz-dev

# mongo-c-driver
sudo apt-get install -y libmongoc-dev libbson-dev libbson-1.0-0

# boost
sudo apt install libboost-all-dev
```

## Benchmarks

The `benchmarks` directory contains the source code for benchmarks, 
while the `results` directory contains the scripts and configuration files for evaluation.


<pre><code>
Pheromone
|---benchmarks
    |---00 # benchmark analysis: Function Chain
    |---01 # data transfer latency: Transfer data
    |---02 # benchmark analysis: Media Service
    |---06 # benchmark analysis: FINRA
|---results # scripts and config files
    |---inter-host
    |---intra-host
</code></pre>


