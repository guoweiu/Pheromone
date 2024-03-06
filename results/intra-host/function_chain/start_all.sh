#!/bin/bash

# Please modify it as required
absolute_path="/home/lgw/Pheromone" # project path
server_ip="192.168.1.129" # ip address of the current server

# --------------------------

config_file_129=${absolute_path}"/results/intra-host/function_chain/config129.yml"
finra_data_path=${absolute_path}"/benchmarks/06/data/"

rm_dir="rm -rf /tmp/sp00; mkdir /tmp/sp00"

# start manager coordinator scheduler
ssh -p 22 lgw@${server_ip} "${rm_dir}; export CONFIG_FILE=${config_file_129}; \
/tmp/SPheromone129/manager/manager 1>/tmp/sp00/manager.log 2>&1 & \
/tmp/SPheromone129/coordinator/coordinator 1>/tmp/sp00/coordinator.log 2>&1 & \
/tmp/SPheromone129/scheduler/scheduler 1>/tmp/sp00/scheduler.log 2>&1 &"

thread_num=2

# start executor
ssh -p 22 lgw@${server_ip} "for ((i = 0; i < ${thread_num}; i++)); do export CONFIG_FILE=${config_file_129}; \
   export FinraDataPath=${finra_data_path}; \
   export LUMINE_GATEWAY_ADDR=192.168.1.129; \
   export LUMINE_GATEWAY_PORT=8084; \
   /tmp/SPheromone129/executor/executor \$i 1>/tmp/sp00/executor_\${i}.log 2>&1 & done"

manager_ip=${server_ip}
# register
ssh -p 22 lgw@${server_ip} "export CONFIG_FILE=${config_file_129}; \
export MANAGER_IP=${manager_ip}; \
 /tmp/SPheromone129/benchmarks/exp00/exp00_register"