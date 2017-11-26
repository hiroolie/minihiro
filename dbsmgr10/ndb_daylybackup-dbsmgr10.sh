#!/bin/bash

# ログ出力関数(logger)
LOGGER='/bin/logger -t NDBBACKUP -i'

# フラグファイル
flgfile=/tmp/NDBBACKUP.flg

# バックアップ対象サーバ
node="dbdat10 dbdat20 dbdat30 dbdat40"

# 処理開始
ret=0

echo "Start ndb data backup"

if test -f $flgfile ; then
  rm -f $flgfile
  echo "フラグファイルが残っていたため削除しました。"
fi

/usr/bin/ndb_mgm -e 'START BACKUP'

ret=$?

if [ $ret != 0 ] ; then
  logger -t NDBBACKUP "NDB back up has occured Error !!"
  touch $flgfile
fi


echo "Archive dir mount on bkupdir"

mount -t nfs bacsrv10:/remote/dbdata /export

if [ -d /export/dbsmgr10 ] ; then

  for ii in ${node}
  do
    echo "ndb data backup from ${ii}" 
    COUNT=1
    /usr/bin/rsync -av --delete root@${ii}:/ndb_data/mysql-cluster/ndb_data/${COUNT}/BACKUP/ /export/${ii}/
    ret=$?
    
    if [ $ret != 0 ] ; then
      logger -t NDBBACKUP "NDB data archive has occured Error ${ii} !!"
      touch $flgfile
    fi
    
    COUNT=$(( COUNT + 1 ))
    
  done

else
  echo "An Error occared in mount backup directory!!"
  ret=1
fi

umount /export

echo "End ndb data backup"

exit $ret
