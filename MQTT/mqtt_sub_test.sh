#!/bin/bash

server=87.10.37.11
port=1883

mosquitto_sub -h $server -p $port -t test/message/# -q 2
