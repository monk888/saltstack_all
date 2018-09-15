#!/bin/bash
for i in `seq 1 10`
do
    mysql -h 192.168.200.204 -urepl -p123456 -e "exit"
    if [ $? -eq 0 ];then
        Bin_log=`mysql -h 192.168.200.204 -urepl -p123456 -e "show master status;"|awk  'NR==2{print $1}'`
        POS=`mysql -h 192.168.200.204 -urepl -p123456 -e "show master status;"|awk  'NR==2{print $2}'`
    mysql -e "change master to master_host='192.168.200.204', master_user='repl', master_password='123456', master_log_file='$Bin_log', master_log_pos=$POS;start slave;"
    touch /etc/my.cnf.d/slave.lock
    exit;
    else
        sleep 60;
    fi
done
