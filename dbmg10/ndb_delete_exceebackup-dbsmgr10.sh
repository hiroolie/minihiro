#!/bin/bash

# ログ出力関数(logger)
LOGGER='/bin/logger -t NDBBKLOGCLEAR -i'

# 
node="ndbd10 ndbd20 ndbd30 ndbd40"
rshcmd=/usr/bin/rsh

# フラグファイル
flgfile=/tmp/NDBBACKUP.flg

# 実行コマンド
execcmd='/usr/bin/find /var/lib/mysql-cluster/BACKUP -type d -mtime +1 -name "BACKUP-*" | xargs /bin/rm -rfv'

# 
echo "Run the delete log files that exceed the retention period." | $LOGGER

if test -f $flgfile ; then
	rm -f $flgfile
	echo -e "Previous NDB backup has failed.\nTo cancel the deletion of log files that exceed the retention period." | $LOGGER
	exit 2
fi


for ii in ${node}
do
	echo "Delete previous NDB archive log on ${ii}" | ${LOGGER}
	${rshcmd} -l root ${ii} "${execcmd}" | ${LOGGER}
done

echo "To exit the removal process log files that exceed the retention period." | $LOGGER

exit 0
