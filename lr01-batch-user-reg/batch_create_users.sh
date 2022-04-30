#!/bin/bash

dir=`dirname $0'
input_file="$dir/users_list.txt"

for i in $(cat $input_file); do
login=$(echo "$i" | awk -F ',' {'print $1'})
password=$(echo "$i" | awk -F ',' {'print $2'})
echo "Create user: $login"

adduser "$login" &>> /dev/null << EOF
$password
$password





Y

EOF

if [ $? -ne 0 ]; then
echo "ERROR: user already exists"
else
echo "User was created successfully"
fi
echo ""

done
