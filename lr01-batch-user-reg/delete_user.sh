#!/bin/bash

dir=`dirname $0`
input_file="$dir/users_list.txt"

back_to_dir="/opt"
back_path="$back_to_dir/reserve.tar"

for i in `cat $input_file`; do
login=$(echo "$i" | awk -F ',' {'print $1'})

tar --directory="/home" -rf $back_path $login &>> /dev/null

if [ $? -ne 0 ];then
echo "ERROR: user directory doesn't exist"
else
echo "Backup was done successfully"
fi

deluser --remove-home "$login" &>>/dev/null

if [ $? -ne 0 ];then
echo  "ERROR: $login doesn't exist"
else
echo "$login was deleted successfully"
fi

done
