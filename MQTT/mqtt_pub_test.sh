#!/bin/bash

server=87.10.37.1
port=1883

c=0
echo "start sending"
while [ $c -gt -1 ]
do
	#echo "Sending: Loop $c"
	mosquitto_pub -h $server -p $port -t test/message/$1 -m "Loop $c $1" -q 2
	(( c++ ))
	sleep 0.0001
done
