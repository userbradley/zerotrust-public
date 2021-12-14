#!/bin/sh
sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list << EOF
deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main
EOF

sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt stretch main
EOF

sudo apt-get install dirmngr
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv E162F504A20CDF15827F718D4B7C549A058F8B6B
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get --assume-yes install pritunl-zero mongodb-org
sudo systemctl start mongod pritunl-zero
sudo systemctl enable mongod pritunl-zero

sudo sh -c 'echo "* hard nofile 100000" >> /etc/security/limits.conf'
sudo sh -c 'echo "* soft nofile 100000" >> /etc/security/limits.conf'
sudo sh -c 'echo "root hard nofile 100000" >> /etc/security/limits.conf'
sudo sh -c 'echo "root soft nofile 100000" >> /etc/security/limits.conf'
