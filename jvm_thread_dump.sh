#!/bin/bash

JAVA_HOME="/opt/java"
COUNT=5
INTERVAL=5

PID=1234

DUMP_LOCATION="/tmp"

for (( c=1; c<=$COUNT; c++ ))
do
jstack -l $PID > $DUMP_LOCATION/$PID_thread_dump_$(date +"%Y-%m-%d_%T")_$i.txt
sleep $INTERVAL
done