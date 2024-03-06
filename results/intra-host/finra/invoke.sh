#!/bin/bash

times=5

ssh -p 22 lgw@192.168.1.129 "export MANAGER_IP=192.168.1.129; \
for ((i = 1; i <= ${times}; i++)); do \
/tmp/SPheromone129/benchmarks/exp06/exp06_invoker 10 $[100000+i]; \
sleep 1s;
done"