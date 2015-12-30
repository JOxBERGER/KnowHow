#!/bin/bash

server=XX.XX.XX.XX
port=1883

mosquitto_sub -h $server -p $port -t test/message/# -q 2
