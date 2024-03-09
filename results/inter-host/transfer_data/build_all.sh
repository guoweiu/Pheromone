#!/bin/bash

# Please modify it as required
absolute_path="/home/lgw/Pheromone" # project path

#----------------------------
fanout_num=80

# precondition
ssh -p 22 lgw@192.168.1.129 "rm -rf /tmp/SPheromone;\
rm -rf /tmp/shm/; mkdir /tmp/shm/; \
cmake -DCMAKE_BUILD_TYPE=debug -S ${absolute_path} -B /tmp/SPheromone129; \
cmake --build /tmp/SPheromone129 \
--target manager coordinator scheduler executor \
exp06_marketdata exp06_run_audit exp06_marginbalance exp06_register exp06_invoker -- -j 16"

ssh -p 22 lgw@192.168.1.126 "rm -rf /tmp/SPheromone;\
rm -rf /tmp/shm/; mkdir /tmp/shm/; \
cmake -DCMAKE_BUILD_TYPE=debug -S ${absolute_path} -B /tmp/SPheromone126; \
cmake --build /tmp/SPheromone126 \
--target manager coordinator scheduler executor \
exp06_marketdata exp06_run_audit exp06_marginbalance exp06_register exp06_invoker -- -j 16"

# copy library file
ssh -p 22 lgw@192.168.1.129 "for ((i = 1; i <= ${fanout_num}; i++)); do cp /tmp/shm/exp06_run_audit.so /tmp/shm/exp06_run_audit_\${i}.so; done"
ssh -p 22 lgw@192.168.1.126 "for ((i = 1; i <= ${fanout_num}; i++)); do cp /tmp/shm/exp06_run_audit.so /tmp/shm/exp06_run_audit_\${i}.so; done"