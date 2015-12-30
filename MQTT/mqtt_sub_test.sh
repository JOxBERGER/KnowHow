#!/bin/bash

server=$1
port=$2

mosquitto_sub -h $server -p $port -t /test/message -q 2
