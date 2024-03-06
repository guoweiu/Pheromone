
# Please modify it as required
absolute_path="/home/lgw/Pheromone" # project path
server_ip="192.168.1.129" # ip address of the current server

# ------
ssh -p 22 lgw@${server_ip} "rm -rf /tmp/SPheromone; rm -rf /tmp/shm/; mkdir /tmp/shm/; cmake -DCMAKE_BUILD_TYPE=debug -S ${absolute_path} -B /tmp/SPheromone129; cmake --build /tmp/SPheromone129 \
--target manager coordinator scheduler executor \
exp06_invoker exp06_marginbalance exp06_marketdata exp06_register exp06_run_audit -- -j 16"