sudo vim /etc/ssh/sshd_config
sudo service sshd restart

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo yum localinstall google-chrome-stable_current_x86_64.rpm
google-chrome-stable --version

curl -sL https://rpm.nodesource.com/setup_13.x | sudo bash -
sudo yum install nodejs
node -v

git clone https://github.com/Steemhunt/prerender.git
cd ~/prerender && npm install

# Demonize server
sudo npm install -g pm2@latest
CACHE_MAXSIZE=10000 CACHE_TTL=600 pm2 start server.js # 10,000 items for 10 minutes
pm2 startup systemd # and copy the last command
