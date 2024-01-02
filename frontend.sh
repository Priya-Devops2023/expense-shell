#installing the nginx
dnf install nginx -y

#coping the conf file
cp expense.conf  /etc/nginx/default.d/expense.conf
# Enabling and starting the nginx
systemctl enable nginx
systemctl start nginx

#removing the files /usr/share/nginx/html/
rm -rf /usr/share/nginx/html/*

#downloading the contets if frontend zip
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

#changing the directory and unzip the content
cd /usr/share/nginx/html/
unzip /tmp/frontend.zip

#Editing the expense file
vim /etc/nginx/default.d/expense.conf
