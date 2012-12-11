#!/bin/bash

# ログ出力関数(logger)
LOGGER='/bin/logger -t NDBBACKUP -i'

# フラグファイル
flgfile=/tmp/NDBBACKUP.flg

# バックアップ対象サーバ
node="dbmg10 dbmg20 ndbd10 ndbd20"

# 処理開始

echo "Start ndb data backup" | $LOGGER

if test -f $flgfile ; then
	rm -f $flgfile
	echo "フラグファイルが残っていたため削除しました。" | $LOGGER
fi

/usr/bin/ndb_mgm -e 'START BACKUP' | $LOGGER

ret=$?

if [ $ret != 0 ] ; then
	logger -t NDBBACKUP "NDB back up has occured Error"
	touch $flgfile
fi


for ii in ${node} 
do
	echo "ndb data backup from ${ii}" | $LOGGER 
	/usr/bin/rsync -av --delete root@${ii}:/var/lib/mysql-cluster/BACKUP/ rsync://192.168.16.158/dbdata/${ii}/ | $LOGGER
	ret=$?
	
	if [ $ret != 0 ] ; then
		logger -t NDBBACKUP "NDB data archive has occured Error ${ii}"
		touch $flgfile
	fi
		
done

echo "End ndb data backup" | $LOGGER

exit $ret
