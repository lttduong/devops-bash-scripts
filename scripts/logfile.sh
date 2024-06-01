#!/bin/bash

logfile1=/var/log/syslog
logfile2=/var/log/cloud-init.log

mydatexpr=`date +%b\ %d`

for log in $logfile{1,2}
do
echo $log BEGIN
egrep "$mydatexpr" $log
echo $log END
done