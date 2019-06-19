#!/bin/bash

# https://github.com/thilinaba/utility_scripts

JAVA_HOME="/opt/java"
COUNT=5
INTERVAL=5

PID=$(cat /opt/wso2am-2.6.0/wso2carbon.pid)

DUMP_LOCATION="/tmp"

for (( c=1; c<=$COUNT; c++ ))
do
jstack -l $PID > $DUMP_LOCATION/$PID_thread_dump_$(date +"%Y-%m-%d_%T")_$i.txt
sleep $INTERVAL
done
