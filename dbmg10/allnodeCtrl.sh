#!/bin/bash
#
# sendmail      This shell script takes care of starting and stopping
#               sendmail.
#
# chkconfig: 2345 80 30
# description: Running mysql-cluster system.
# processname: mysql-cluste
# config: /var/lib/mysql-cluster/config.ini
# pidfile: /var/run/mysql-cluste.pid

# Source function library.
. /etc/rc.d/init.d/functions

rshcmd=/usr/bin/rsh

RETVAL=0

case "$1" in
  ndbmtd)
        node="dbmg10 dbmg20 ndbd10 ndbd20"
        PROG="ndbmtd"
        execcmd='/etc/init.d/ndbmtd start'
        ;;
  ndb_mgmd)
       node="dbmg10 dbmg20"
       PROG="ndb_mgmd"
       execcmd='/etc/init.d/ndb_mgmd start'
       ;;
  mysqld)
       node="dbmg10 dbmg20"
       PROG="mysql-cluster"
       execcmd='/etc/init.d/mysql-cluster start'
       ;;
  -h)
       echo "Usage: ndb_mgmd|ndbmtd|mysql|<other cmd>"
       exit
       ;;
  *)
       node="dbmg10 dbmg20 ndbd10 ndbd20"
       execcmd=$1
       ;;
esac

# Start daemons.

for ii in ${node} ; do echo -e "=== ${ii} start ${PROG} ===" ; ${rshcmd} ${ii}  -l root -n "nohup ${execcmd} > /tmp/log 2>&1 < /tmp/log &" : echo -e "\n" ; done

RETVAL=$?

exit $RETVAL
