# MARK: - System updates
sudo update-locale LANG=en_US.UTF-8 LANGUAGE= LC_CTYPE="en_US.UTF-8" LC_NUMERIC="en_US.UTF-8" LC_TIME="en_US.UTF-8" LC_COLLATE="en_US.UTF-8" LC_MONETARY="en_US.UTF-8" LC_MESSAGES="en_US.UTF-8" LC_PAPER="en_US.UTF-8" LC_NAME="en_US.UTF-8" LC_ADDRESS="en_US.UTF-8" LC_TELEPHONE="en_US.UTF-8" LC_MEASUREMENT="en_US.UTF-8" LC_IDENTIFICATION="en_US.UTF-8" LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8

sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove

sudo dpkg-reconfigure tzdata # Set it KST
sudo service cron restart # MUST

sudo vim /etc/ssh/sshd_config
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
sudo apt update && sudo apt install google-chrome-stable # 80.0.3987.87
google-chrome-stable --version

sudo apt install -y curl python-software-properties
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt update && sudo apt install -y nodejs
node -v

git clone https://github.com/Steemhunt/prerender.git
cd ~/prerender && npm install

# Demonize server
sudo npm install -g pm2@latest
# CACHE_MAXSIZE=10000 CACHE_TTL=1200 pm2 start prerender.js --node-args="--max_old_space_size=15000" # 10,000 items for 10 minutes / memory limit 15G
pm2 start prerender.js # --max-memory-restart 200M
pm2 startup systemd # and copy the last command


# Monitor log file and restart the process when there's 504 error
# REF: https://github.com/prerender/prerender/issues/614
sudo apt install swatch
pm2 start swatch.sh