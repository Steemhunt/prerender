# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install google-chrome-stable # 73.0.3683.86

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

git clone git@github.com:Steemhunt/prerender.git
cd ~/prerender && npm install

# Demonize server
sudo npm install -g pm2
pm2 start server.js
pm2 startup systemd # and copy the last command