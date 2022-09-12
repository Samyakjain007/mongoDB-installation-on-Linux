#!/usr/bin/sh

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

sudo apt-get install gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt-get update

sudo apt-get install -y mongodb-org

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-mongosh hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
##############################################################################################
## after installation is succesfull, execute these following commands
##############################################################################################
#To run and manage your mongod process, you will be using your operating system's built-in init system.
#Recent versions of Linux tend to use systemd (which uses the systemctl command), while older versions of Linux tend to use System V init (which uses the service command).
#If you are unsure which init system your platform uses, run the following command

ps --no-headers -o comm 1 ## it should output either systemd or System V


#################################
## for starting mongo as a service
##################################
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl stop mongod
sudo systemctl restart mongod
###--END--###
