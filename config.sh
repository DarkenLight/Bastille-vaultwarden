#!/usr/bin/env bash

project_name="vaultwarden"
# project_home="/usr/local/www"
envfile_path="/usr/local/etc/rc.conf.d/vaultwarden"
# project_user="www"
# project_group=$project_user

echo "Starting $project_name Setup"

clear

echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo " \ \    / //\   | |  | || |  |__   __|\ \        / //\    |  __ \ |  __ \ |  ____|| \ | |";
echo "  \ \  / //  \  | |  | || |     | |    \ \  /\  / //  \   | |__) || |  | || |__   |  \| |";
echo "   \ \/ // /\ \ | |  | || |     | |     \ \/  \/ // /\ \  |  _  / | |  | ||  __|  | . \` |";
echo "    \  // ____ \| |__| || |____ | |      \  /\  // ____ \ | | \ \ | |__| || |____ | |\  |";
echo "     \//_/    \_\\____/ |______||_|       \/  \//_/    \_\|_|  \_\|_____/ |______||_| \_|";
echo "                                                                                          "
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo "                          MANAGED FIREFLY-III SCRIPTED INSTALLER                         "
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

database_url = "mysql://$db_username:$db_password@$db_hostname:3306/$db_name
CMD echo 'DATABASE_URL=$database_url' >> $envfile_path
CMD echo 'export DATABASE_URL' >>  $envfile_path

# find $envfile_path -type f -exec sed -i '' -e "/^DATABASE_URL=/s/=.*/=0.0.0.0./" {} \;

echo "Database Connection Complete"
echo "Setup complete"
