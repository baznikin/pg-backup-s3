#!/bin/bash

if [ -z BUCKET]; then
  echo "No BUCKET set!"
  exit 1
fi

source /opt/import_env.sh

DBLIST=`echo "SELECT datname FROM pg_database;" | psql postgres -h $HOST -U stolon | tail -n +3 | head -n -2 | egrep -v 'template0|template1|postgres'`

for db in $DBLIST
do
  datetime=$(date +"%F-%R")
  echo "====== Backup $db"
  pg_dump -h $HOST -U stolon -Z 9 $db | s3cmd put - s3://pg-backups/${db}/${db}_${datetime}.gz
done