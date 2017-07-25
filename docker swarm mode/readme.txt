docker swarm init  --advertise-addr 192.168.99.102

docker swarm join --token SWMTKN-1-4zjrf90kctbqeig4czvm5vc6ktfczebrh2ewc0co06frhoq30o-198jx5icyb5pcpvcsjdxn622e 192.168.99.102:2377


docker network create --driver overlay swarm_test





docker service create --replicas 2 --name helloworld --network=swarm_test nginx:alpine



docker service scale helloworld=3