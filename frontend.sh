source common.sh

print_head "Install Nginx"
yum install nginx -y &>>${LOG}
status_check

print_head "Remove Nginx Old Content"
rm -rf /usr/share/nginx/html/* &>>${LOG}
status_check

cd /usr/share/nginx/html &>>${LOG}

print_head "Extract Frontend Content"
unzip /tmp/frontend.zip &>>${LOG}
status_check

print_head "Copy Roboshop Nginx Config File"
# shellcheck disable=SC2154
cp ${script_location}/files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf &>>${LOG}
status_check

print_head "Enable nginx"
systemctl enable nginx &>>${LOG}
status_check

print_head "Start Nginx"
systemctl restart nginx &>>${LOG}
status_check

