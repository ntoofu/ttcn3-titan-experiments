#!/bin/sh

sudo iptables -A INPUT -p tcp --dport 9999 -j DROP
sudo ${TTCN3_DIR}/bin/ttcn3_start ${TEST_NAME} "$@"
