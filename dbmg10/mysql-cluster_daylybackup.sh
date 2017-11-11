#!/bin/bash

# ログ出力関数(logger)
LOGGER='/bin/logger -t NDBBACKUP -i'

# フラグファイル
flgfile=/tmp/NDBBACKUP.flg

# バックアップ対象サーバ
node="dbdat10 dbdat20 dbdat30 dbdat40"

# 処理開始
ret=0

echo "Start ndb data backup" | $LOGGER

if test -f $flgfile ; then
	rm -f $flgfile
	echo "フラグファイルが残っていたため削除しました。" | $LOGGER
fi

/usr/local/mysql/bin/ndb_mgm -e 'START BACKUP' | $LOGGER

ret=$?

if [ $ret != 0 ] ; then
	logger -t NDBBACKUP "NDB back up has occured Error"
	touch $flgfile
fi


echo "Archive dir mount on bkupdir" | $LOGGER

mount -t nfs bacsrv10:/remote/dbdata /export | $LOGGER

if [ -d /export/dbmg10 ] ; then
	COUNT=1
	for ii in ${node} 
	do
		echo "ndb data backup from ${ii}" | $LOGGER 
		/usr/bin/rsync -av --delete root@${ii}:/var/lib/mysql-cluster/ndb_data/${COUNT}/BACKUP/ /export/${ii}/ | $LOGGER
		ret=$?
		COUNT=$(( COUNT + 1 ))
		if [ $ret != 0 ] ; then
			logger -t NDBBACKUP "NDB data archive has occured Error ${ii}"
			touch $flgfile
		fi
		
	done

else
	echo "An Error occared in mount backup directory" | $LOGGER
	ret=1
fi

umount /export | $LOGGER

echo "End ndb data backup" | $LOGGER

exit $ret
