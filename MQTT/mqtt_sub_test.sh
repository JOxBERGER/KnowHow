#!/bin/bash

server=87.106.37.18
port=1883

mosquitto_sub -h $server -p $port -t test/message/# -q 2
