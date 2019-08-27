#!/bin/bash

# https://github.com/thilinaba/utility_scripts

JAVA_HOME="/opt/java"
PATH="$JAVA_HOME/bin:$PATH"
COUNT=5
INTERVAL=30

PID=$(cat /opt/wso2am-2.6.0/wso2carbon.pid)

DUMP_LOCATION="/tmp"

echo "###################################"
echo "PID $PID"
echo "Count: $COUNT"
echo "Interval(sec): $INTERVAL)"
echo "Dump location: $DUMP_LOCATION"
echo "###################################"

for (( c=1; c<=$COUNT; c++ ))
do
echo "Taking thread dump $c ..."
jstack -l $PID | gzip -c > $DUMP_LOCATION/$PID-thread_dump_$(date +"%Y-%m-%d_%T")_$c.txt.gz
echo "Thread dump $c completed! Sleeping for $INTERVAL seconds"

if [ $c -lt $COUNT ]; then sleep $INTERVAL; fi

done
