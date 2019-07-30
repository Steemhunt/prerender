# MARK: - System updates
sudo update-locale LANG=en_US.UTF-8 LANGUAGE= LC_CTYPE="en_US.UTF-8" LC_NUMERIC="en_US.UTF-8" LC_TIME="en_US.UTF-8" LC_COLLATE="en_US.UTF-8" LC_MONETARY="en_US.UTF-8" LC_MESSAGES="en_US.UTF-8" LC_PAPER="en_US.UTF-8" LC_NAME="en_US.UTF-8" LC_ADDRESS="en_US.UTF-8" LC_TELEPHONE="en_US.UTF-8" LC_MEASUREMENT="en_US.UTF-8" LC_IDENTIFICATION="en_US.UTF-8" LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8

sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove

sudo dpkg-reconfigure tzdata # Set it KST
sudo service cron restart # MUST

sudo vim /etc/ssh/sshd_config # change port to 2222
sudo service sshd restart

USER_NAME="updatebot"
sudo adduser $USER_NAME
sudo adduser $USER_NAME sudo
sudo su $USER_NAME
cd && mkdir .ssh
sudo su
echo "updatebot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
exit


# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt install google-chrome-stable # 73.0.3683.86
google-chrome-stable --version

sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

git clone git@github.com:Steemhunt/prerender.git
cd ~/prerender && npm install

# Demonize server
sudo npm install -g pm2
pm2 start server.js
pm2 startup systemd # and copy the last command
