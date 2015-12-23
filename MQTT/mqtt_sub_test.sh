#!/bin/bash

server=192.168.178.27
port=1883

mosquitto_sub -h $server -p $port -t test/message/# -q 2
