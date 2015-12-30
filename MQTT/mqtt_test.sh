#!/bin/bash

# start with
# mqtt_test.sh {IPAdress} {Port}
# example: mqtt_test.sh 192.168.1.1 1883

server=$1
port=$2

screen -mdS pub1 /bin/bash ./mqtt_pub_test.sh $server $port

screen -mdS sub /bin/bash ./mqtt_sub_test.sh $server $port

screen -r sub

echo "done"
