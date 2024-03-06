#!/bin/bash

# precondition
ssh -p 22 lgw@192.168.1.129 "cmake --build /tmp/SPheromone129 \
--target manager coordinator scheduler executor \
exp00_invoker exp00_front exp00_back exp00_register -- -j 16"

ssh -p 22 lgw@192.168.1.126 "cmake --build /tmp/SPheromone126 \
--target manager coordinator scheduler executor \
exp00_invoker exp00_front exp00_back exp00_register -- -j 16"