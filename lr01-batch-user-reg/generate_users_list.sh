#!/bin/bash

dir=`dirname $0`
result_file="$dir/users_list.txt"

count_users=500

rm $result_file

for i in $(seq -w 1 $count_users); do
login="user$i"
password=$(pwgen -s 8 1)
echo "$login,$password">>$result_file

done
