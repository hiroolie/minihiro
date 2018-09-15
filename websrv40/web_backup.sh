#!/bin/bash

# ログ出力関数(logger)
LOGGER='/bin/logger -t WEBBACKUP -i'

# フラグ
ret=0

# 処理開始

echo "Start web data backup" | $LOGGER

/usr/bin/rsync -av --delete --exclude="/cache/" --exclude="/lost+found/" /DATA/ rsync://bacsrv10/webdata/ | $LOGGER
ret=$?

if [ $ret -ne 0 ] ; then
	logger -t WEBBACKUP "WEB back up has occured Error"
	touch $flgfile
	ret=1
fi

echo "End web data backup" | $LOGGER

exit $ret
