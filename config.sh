#!/usr/bin/env bash

project_name="vaultwarden"
envfile_path="/usr/local/etc/rc.conf.d/vaultwarden"

echo "Starting $project_name Setup"
service vaultwarden stop

clear

echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo " \ \    / //\   | |  | || |  |__   __|\ \        / //\    |  __ \ |  __ \ |  ____|| \ | |";
echo "  \ \  / //  \  | |  | || |     | |    \ \  /\  / //  \   | |__) || |  | || |__   |  \| |";
echo "   \ \/ // /\ \ | |  | || |     | |     \ \/  \/ // /\ \  |  _  / | |  | ||  __|  | . \` |";
echo "    \  // ____ \| |__| || |____ | |      \  /\  // ____ \ | | \ \ | |__| || |____ | |\  |";
echo "     \//_/    \_\\____/ |______||_|       \/  \//_/    \_\|_|  \_\|_____/ |______||_| \_|";
echo "                                                                                          "
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo "                          MANAGED $project_name SCRIPTED INSTALLER                         "
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo
echo

read -p "Do you want to Install the Database server as well?? Enter \"N\" if you have database server running." -n 1 -r
echo  # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo  "WILL BE ADDED IN THE FUTURE"
fi

echo "Enter Database Hostname or IP Address: "
read -p ">>" db_hostname
echo "Enter Database Name: "
read -p ">>" db_name
echo "Enter Database Username: "
read -p ">>" db_username
echo "Enter Database Password: "
read -p ">>" db_password

echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo "Entered Details are Below"
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo "DB_HOSTNAME = $db_hostname"
echo "DB_DATABASE = $db_name"
echo "DB_USERNAME = $db_username"
echo "DB_PASSWORD = $db_password"
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

# Server IP/Port 192.168.1.10:3306 UN: dbuser / PW: yourpassword / DB: vaultwarden
# mysql://dbuser:yourpassword@192.168.1.10:3306/vaultwarden

echo "DATABASE_URL=mysql://$db_username:$db_password@$db_hostname:3306/$db_name">> $envfile_path
echo 'export DATABASE_URL' >>  $envfile_path

find $envfile_path -type f -exec sed -i '' -e "/^ROCKET_ADDRESS=/s/=.*/=0.0.0.0./" {} \;

echo "Database Connection Complete"
echo "Setup complete"
service vaultwarden start
