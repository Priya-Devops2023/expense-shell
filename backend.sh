#Disabling the existing nodejs and enabling the nodejs 18 version

dnf module disable nodejs -y
dnf module enable nodejs:18 -y

#installing the nodejs
dnf install nodejs -y

#coping the backend service file to the desired location
cp backend.service /etc/systemd/system/backend.service

#Adddind a user
useradd expense

#creating a directory
mkdir /app

#Downloaing and unzipping the backend application files in the app directory
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip

#changing to that directory and installing
cd /app
npm install

# load the database and start the service
systemctl daemon-reload

systemctl enable backend
systemctl start backend

#Install the mysql client
dnf install mysql -y

#Run the mysql command
mysql -h mysql-dev.pdp2023.online -uroot -pExpenseApp@1 < /app/schema/backend.sql