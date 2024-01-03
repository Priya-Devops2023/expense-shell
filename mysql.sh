#Disable the existing mysql in the server to download our version
dnf module disable mysql -y

#copy the repo file to installing location then install mysql server

cp mysql.repo /etc/yum.repos.d/mysql.repo
dnf install mysql-community-server -y

#statrt the service
systemctl enable mysqld
systemctl start mysqld

#set our own passwd
mysql_secure_installation --set-root-pass ExpenseApp@1
mysql -uroot -pExpenseApp@1