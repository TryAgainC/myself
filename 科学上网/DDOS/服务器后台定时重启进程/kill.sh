#!/bin/bash

pid1 =`ps -aux |grep "python3 linux_cc_byshell.py"|grep -v "grep" |awk '{print $2}'`
kill -9 $pid1
pid2 = `ps -aux |grep "bash reboot.sh"|grep -v "grep" |awk '{print $2}'`
kill -9 $pid2
pid3 = `ps -aux |grep "sleep 300"|grep -v "grep" |awk '{print $2}'`
kill -9 $pid3


