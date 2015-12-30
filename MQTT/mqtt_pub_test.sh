#!/bin/bash

server=$1
port=$2

c=0
echo "start sending"
while [ $c -gt -1 ]
do
	#echo "Sending: Loop $c"
	mosquitto_pub -h $server -p $port -t /test/message -m "Loop $c" -q 2
	(( c++ ))
	sleep 0.0001
done
