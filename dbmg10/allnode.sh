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
        node="ndbd10 ndbd20 ndbd30 ndbd40"
        execcmd='/etc/init.d/ndbmtd start'
        ;;
  ndbmtd-init)
        node="ndbd10 ndbd20 ndbd30 ndbd40"
	execcmd='/usr/sbin/ndbmtd --initial'
	;;
  mysql)
       node="dbmg10 dbmg20"
       execcmd='/etc/init.d/mysql-cluster start'
       ;;
  shutdown)
       node="ndbd20 ndbd10 dbmg20 dbmg10"
       execcmd='/sbin/shutdown -h now'
       ;;
  *)
       #node="dbmg10 dbmg20 ndbd10 ndbd20 ndbd30 ndbd40"
       node="ndbd10 ndbd20 ndbd30 ndbd40"
       execcmd=$1
       ;;
esac

# Start daemons.

for ii in ${node} ; do echo -e "=== ${ii} ===" ; ${rshcmd} -l root ${ii} "${execcmd}" ; echo -e "\n" ; done

RETVAL=$?

exit $RETVAL
