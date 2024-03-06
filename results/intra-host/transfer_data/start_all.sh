#!/bin/bash


absolute_path="/home/lgw/Pheromone"
server_ip="192.168.1.129"


config_file=${absolute_path}"/results/intra-host/transfer_data/config129.yml"

log_dir="/tmp/sp01"

rm_dir="rm -rf ${log_dir}; mkdir ${log_dir}"

# start manager coordinator scheduler
ssh -p 22 lgw@${server_ip} "${rm_dir}; export CONFIG_FILE=${config_file}; \
/tmp/SPheromone129/manager/manager 1>${log_dir}/manager.log 2>&1 & \
/tmp/SPheromone129/coordinator/coordinator 1>${log_dir}/coordinator.log 2>&1 & \
/tmp/SPheromone129/scheduler/scheduler 1>${log_dir}/scheduler.log 2>&1 &"


thread_num=2

## shellcheck disable=SC2004
#for ((i = 0; i < ${thread_num}; i++)); do
#  ${build_dir}/executor/executor $i 1>${log_dir}/executor_${i}.log 2>&1 &
#done
#
#sleep 1
#
#${build_dir}/benchmarks/01/exp01_register

# start executor
ssh -p 22 lgw@${server_ip} "for ((i = 0; i < ${thread_num}; i++)); do export CONFIG_FILE=${config_file}; \
   /tmp/SPheromone129/executor/executor \$i 1>${log_dir}/executor_\${i}.log 2>&1 & done"

manager_ip=${server_ip}
# register
ssh -p 22 lgw@${server_ip} "export CONFIG_FILE=${config_file}; \
export MANAGER_IP=${manager_ip}; \
 /tmp/SPheromone129/benchmarks/exp01/exp01_register"