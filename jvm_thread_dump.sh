#!/bin/bash

# https://github.com/thilinaba/utility_scripts

JAVA_HOME="/opt/java"
COUNT=5
INTERVAL=30

PID=$(cat /opt/wso2am-2.6.0/wso2carbon.pid)

DUMP_LOCATION="/tmp"

for (( c=1; c<=$COUNT; c++ ))
do
echo "Taking thread dump $c"
jstack -l $PID > $DUMP_LOCATION/$PID_thread_dump_$(date +"%Y-%m-%d_%T")_$c.txt
echo "Thread dump $c completed! Sleeping for $INTERVAL seconds"
sleep $INTERVAL
done
