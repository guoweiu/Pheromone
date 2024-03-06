#!/bin/bash

build_dir="/tmp/SPheromone129"

export MANAGER_IP="192.168.1.129"

#payloads=("512B" "1KB" "512KB" "1MB")
payloads=("512B" "512KB")
chain_lens=(2 16 32 64 128)

# shellcheck disable=SC2068
for payload in ${payloads[@]}; do
  for chain_len in ${chain_lens[@]}; do
    for i in {1..5}; do
      ${build_dir}/benchmarks/exp00/exp00_invoker ${chain_len}  ${payload}
      sleep 1s
    done
  done
done
