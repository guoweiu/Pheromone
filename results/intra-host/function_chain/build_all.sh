
# Please modify it as required
absolute_path="/home/lgw/Pheromone" # project path
server_ip="192.168.1.129" # ip address of the current server

ssh -p 22 lgw@${server_ip} "rm -rf /tmp/SPheromone;\
rm -rf /tmp/shm/; mkdir /tmp/shm/;\
cmake -DCMAKE_BUILD_TYPE=debug -S ${absolute_path} -B /tmp/SPheromone129;\
cmake --build /tmp/SPheromone129 \
--target manager coordinator scheduler executor \
exp00_back exp00_front exp00_invoker exp00_register -- -j 16"