#!/bin/bash -p

pidfile=/home/jobuser/jobscheduler/scheduler/logs/scheduler.pid

pidf=`cat ${pidfile}`
pidp=`ps -p ${pidf} -eo pid,comm | grep scheduler | awk '{ print $1 }'`

if [ "${pidf}" = "${pidp}" ]; then
  exit 0
else
  echo "Jobscheduler agent has gone away. Restart this."
  /etc/init.d/jobscdl_agent restart
  if [ $? -ne 0 ];then
    echo "Failed Jobscheduler agent restart."
    exit 2
  else
    echo "Success Jobscheduler agent restart."
    exit 0
  fi
fi
exit
