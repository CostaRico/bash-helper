#!/bin/bash
read -p "Set ssh address (ex: root@1.1.1.1):" ssh_addr
echo "Ssh addr is $ssh_addr"

default_host='localhost'
read -p "Set host remote mysql host [$default_host]:" remote_mysql_host
remote_mysql_host=${remote_mysql_host:-$default_host}
echo "Remote mysql host is: $remote_mysql_host"

default_user='mysql_remote_user'
read -p "Set  remote mysql user [$default_user]:" remote_mysql_user
remote_mysql_user=${remote_mysql_user:-$default_user}
echo "Remote mysql user is: $remote_mysql_user"

default_dbname='mysql_remote_dbname'
read -p "Set remote mysql dbname [$default_dbname]:" remote_mysql_dbname
remote_mysql_dbname=${remote_mysql_dbname:-$default_dbname}
echo "Remote mysql dbname is: $remote_mysql_dbname"


read -p "Set remote mysql password [$default_dbname]:" remote_mysql_pass

now=$(date +"%m_%d_%Y")
tmp_name=${remote_mysql_dbname}_backup-$now.sql
ssh $ssh_addr "mysqldump -v -h $remote_mysql_host -u $remote_mysql_user -p$remote_mysql_pass $remote_mysql_dbname > ~/$tmp_name"
#mysqldump -h [server] -u [user] -p[password] db1 | mysql -h [server] -u [user] -p[password] db2


echo "\n\n\n\n"

echo "Next lets copy it to local database"
read -p "Set local mysql host [$default_host]:" local_mysql_host
local_mysql_host=${local_mysql_host:-$default_host}
echo "Local mysql host is: $local_mysql_host"

default_user='root'
read -p "Set  local mysql user [$default_user]:" local_mysql_user
local_mysql_user=${local_mysql_user:-$default_user}
echo "Remote mysql user is: $local_mysql_user"

default_dbname='mysql_local_dbname'
read -p "Set local mysql dbname [$default_dbname]:" local_mysql_dbname
local_mysql_dbname=${local_mysql_dbname:-$default_dbname}
echo "Local mysql dbname is: $local_mysql_dbname"

read -p "Set local mysql password [empty]:" local_mysql_pass


echo "\n\n\n\n"
read -p "I will delete current local database if it exists, ok?" yn
case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;break;;
esac

DBCONN="-h ${local_mysql_host} -u ${local_mysql_user} --password=${local_mysql_pass}"

echo "Copy database from remote server"
scp $ssh_addr:~/$tmp_name ~
echo "Drop database if exists"
echo "DROP DATABASE IF EXISTS ${local_mysql_dbname}" | mysql ${DBCONN}
printf "\n"
printf "\n"
printf "\n"
echo "Create database"
echo "CREATE DATABASE ${local_mysql_dbname}" | mysql ${DBCONN}


mysql ${DBCONN} ${local_mysql_dbname} < ~/$tmp_name
