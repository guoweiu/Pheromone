#!/bin/bash

config_file_129="/home/lgw/Pheromone/results/inter-host/function_chain/config129.yml"
config_file_126="/home/lgw/Pheromone/results/inter-host/function_chain/config126.yml"

finra_data_path="/home/lgw/Pheromone/benchmarks/06/data/"

rm_dir="rm -rf /tmp/sp01; mkdir /tmp/sp01"

# start manager coordinator scheduler
ssh -p 22 lgw@192.168.1.129 "${rm_dir}; export CONFIG_FILE=${config_file_129}; \
/tmp/SPheromone129/manager/manager 1>/tmp/sp01/manager.log 2>&1 & \
/tmp/SPheromone129/coordinator/coordinator 1>/tmp/sp01/coordinator.log 2>&1 & \
/tmp/SPheromone129/scheduler/scheduler 1>/tmp/sp01/scheduler.log 2>&1 &"

ssh -p 22 lgw@192.168.1.126 "${rm_dir}; export CONFIG_FILE=${config_file_126}; \
/tmp/SPheromone126/coordinator/coordinator 1>/tmp/sp01/coordinator.log 2>&1 & \
/tmp/SPheromone126/scheduler/scheduler 1>/tmp/sp01/scheduler.log 2>&1 &"

thread_num=1

# start executor
ssh -p 22 lgw@192.168.1.129 "for ((i = 0; i < ${thread_num}; i++)); do export CONFIG_FILE=${config_file_129}; \
   export FinraDataPath=${finra_data_path}; \
   export LUMINE_GATEWAY_ADDR=192.168.1.129; \
   export LUMINE_GATEWAY_PORT=8084; \
   /tmp/SPheromone129/executor/executor \$i 1>/tmp/sp01/executor_\${i}.log 2>&1 & done"

ssh -p 22 lgw@192.168.1.126 "for ((i = 0; i < ${thread_num}; i++)); do export CONFIG_FILE=${config_file_126}; \
   export FinraDataPath=${finra_data_path}; \
   export LUMINE_GATEWAY_ADDR=192.168.1.129; \
   export LUMINE_GATEWAY_PORT=8084; \
   /tmp/SPheromone126/executor/executor \$i 1>/tmp/sp01/executor_\${i}.log 2>&1 & done"

manager_ip="192.168.1.129"
# register
ssh -p 22 lgw@192.168.1.129 "export CONFIG_FILE=${config_file_129}; \
export MANAGER_IP=${manager_ip}; \
 /tmp/SPheromone129/benchmarks/exp00/exp00_register"