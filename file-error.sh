#!/bin/bash
passwd=`md5sum /etc/passwd |cut -d" " -f1`
shadow=`md5sum /etc/shadow |cut -d" " -f1`
sudoers=`md5sum /etc/sudoers |cut -d" " -f1`
group=`md5sum /etc/group |cut -d" " -f1`
while true; do
    passwd_new=`md5sum /etc/passwd |cut -d" " -f1`
    shadow_new=`md5sum /etc/shadow |cut -d" " -f1`
    sudoers_new=`md5sum /etc/sudoers |cut -d" " -f1`
    group_new=`md5sum /etc/group |cut -d" " -f1`

    if [ $passwd != $passwd_new ];then
        echo "/etc/passwd 文件已被修改！！修改时间：`date +%F,%T`如非本人操作请检查！"| mail -s "警告！" 13891778429@163.com 
        echo "[`date +'%F,%T'`] passwd文件已被修改，已发送告警邮件至13891778429@163.com" >> /var/log/mail.log
        passwd=$passwd_new
    elif [ $shadow != $shadow_new ];then
        echo "/etc/shadow 文件已被修改！！修改时间：`date +%F,%T`如非本人操作请检查！" | mail -s "警告！" 13891778429@163.com 
        echo "[`date +'%F,%T'`] shadow文件已被修改，已发送告警邮件至13891778429@163.com" >> /var/log/mail.log
        shadow=$shadow_new
    elif [ $sudoers != $sudoers_new ];then
        echo "/etc/sudoers 文件已被修改！！修改时间：`date +%F,%T`如非本人操作请检查！" | mail -s "警告！" 13891778429@163.com 
        echo "[`date +'%F,%T'`] sudors文件已被修改，已发送告警邮件至13891778429@163.com" >> /var/log/mail.log
        sudoers=$shadow_new
    elif [ $group != $group_new ];then
        echo "/etc/group 文件已被修改！！修改时间：`date +%F,%T`如非本人操作请检查！" | mail -s "警告！" 13891778429@163.com 
        echo "[`date +'%F,%T'`] group文件已被修改，已发送告警邮件至13891778429@163.com" >> /var/log/mail.log
        group=$group_new
    fi  
        sleep 10   
done
