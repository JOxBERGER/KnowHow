#!/bin/bash

screen -mdS pub1 /bin/bash ./mqtt_pub_test.sh a
screen -mdS pub2 /bin/bash ./mqtt_pub_test.sh b
screen -mdS pub3 /bin/bash ./mqtt_pub_test.sh c
screen -mdS pub4 /bin/bash ./mqtt_pub_test.sh d

screen -mdS sub /bin/bash ./mqtt_sub_test.sh
screen -r sub

echo "done"
