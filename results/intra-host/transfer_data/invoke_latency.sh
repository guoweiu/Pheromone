#!/bin/bash

build_dir="/tmp/SPheromone129"
export MANAGER_IP="192.168.1.129"


payloads=("256B" "512B" "1KB" "512KB" "1MB" "512MB")
#payloads=("256B" "512B" "1KB" "512KB")

# shellcheck disable=SC2068
for payload in ${payloads[@]}; do
  for i in {1..5}; do
    ${build_dir}/benchmarks/exp01/exp01_invoker "2" ${payload}
    sleep 1s
  done
done