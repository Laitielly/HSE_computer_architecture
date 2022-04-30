#!/bin/bash

dir=`dirname $0`
input_file="$dir/users_list.txt"

back_to_dir="/opt"
backup_name=$(echo `LANG=C date` | awk -F ' |:' {'print"backup_"$2"_"$3"_"$8"_"$4"_"$5"_"$6'})
back_path="$back_to_dir/$backup_name.tar"

for i in $(cat $input_file); do
login=$(echo "$i" | awk -F ',' {'print $1'})

if [ "$1" == "with-backup" ];
then
tar --directory="/home" -rf $back_path $login &>>/dev/null

if [ $? -ne 0 ];
then
echo "ERROR: user directory doesn't exist"
else
echo "Backup was done successfully"
fi
fi

deluser --remove-home "$login" &>>/dev/null

if [ $? -ne 0 ];
then
echo  "ERROR: $login doesn't exist"
else
echo "$login was deleted successfully"
fi

done
