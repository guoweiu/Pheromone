#!/bin/bash

export MANAGER_IP="127.0.0.1"
build_dir=/tmp/dzl/SPheromone/cmake-build-debug-126-host

${build_dir}/benchmarks/exp00/exp00_invoker "4" "64B"