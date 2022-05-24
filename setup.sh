#! /bin/sh

apt-get update
apt-get install -y apt-transport-https \
    build-essential \
    curl \
    gpg \
    wget

# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# NodeJS
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y -p unknown-linux-gnu

# Install above + other packages
apt-get update
apt-get install -y chromium \
    code \
    fish \
    gobuster \
    nodejs \
    python3-pip \
    python3-venv

# Other stuff
usermod --shell /usr/bin/fish vagrant
timedatectl set-timezone Asia/Singapore

# Other apt tasks
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y clean
