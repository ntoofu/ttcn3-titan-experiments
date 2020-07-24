#!/bin/sh

sudo iptables -A INPUT -p tcp --dport 10001 -j DROP
sudo iptables -A INPUT -p tcp --dport 10002 -j DROP
sudo ./${TEST_NAME} "$@"
