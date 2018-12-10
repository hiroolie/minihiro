#!/bin/bash

# ログ出力関数(logger)
LOGGER='/bin/logger -t NDBBKLOGCLEAR -i'

# 
node="dbdat10 dbdat20 dbdat30 dbdat40"
rshcmd=/usr/bin/ssh

# 実行コマンド
execcmd='/usr/bin/find /ndb_data/mysql-cluster/ndb_data/*/BACKUP -type d -mtime +1 -name "BACKUP-*" | xargs /bin/rm -rfv'

# 
echo "Run the delete log files that exceed the retention period."

for ii in ${node}
do
  echo "Delete previous NDB archive log on ${ii}"
  ${rshcmd} root@${ii} "${execcmd}"
done

echo "To exit the removal process log files that exceed the retention period."

exit
