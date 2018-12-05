#!/usr/bin/bash
#descirbe:view status process
#auth:Both
#test commit
#set -e
set +x
status_list=("R" "Z" "D" "I" "S" "T")
if [ $# -lt 1 ];then
	echo -e "\033[31;1mEX:./proccess_status.sh [R|Z|D|I|S|T]\033[0m"
	exit
fi
stat=`echo ${status_list[@]}|grep $1 >/dev/null&& echo 0 || echo 1`
if [ $stat -ne 0 ];then
	echo -e "\033[31;1mEX:./proccess_status.sh [R|Z|D|I|S|T]\033[0m"
        exit
fi
IFS=$'\n\n'
for line in $(ps aux)
do
	echo $line |awk -F " " '{print $8}' |grep -e "^$1" >/dev/null
	if [ $? -eq 0 ];then
		echo $line
	fi
done 
