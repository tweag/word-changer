#!/bin/bash

install -m 755 /home/source/etc/rc.local /etc
install -m 644 /home/source/etc/default.apache_template /etc/default.apache_template
install -m 644 /home/source/etc/ports.conf.apache_template /etc/ports.conf.apache_template
cp /home/source/var/www/index.html /var/www/index.html
api_conf="/home/source/unicorn_api.conf"
[ -e "$api_conf" ] && cp $api_conf /etc/

apt-get update
apt-get install -y inotify-tools

apt-get install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
pyenv install 2.7.9

install -m 755 /home/source/word-changer /usr/bin/word-changer

exit 0
