#!/bin/bash
sleep_time=3600
while :
do
  pid=`ps -aux |grep "python3 cc_keeplive.py"|grep -v "grep" |awk '{print $2}'`
  kill -9 $pid
  nohup python3 cc_keeplive.py >> /dev/null 2>&1 &
  sleep $sleep_time
done
