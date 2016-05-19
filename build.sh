#!/bin/bash

install -m 755 /home/source/etc/rc.local /etc

api_conf="/home/source/unicorn_api.conf"
[ -e "$api_conf" ] && cp $api_conf /etc/

apt-get update
apt-get install -y inotify-tools

apt-get install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev

git clone https://github.com/yyuu/pyenv.git /opt/.pyenv
export PYENV_ROOT="/opt/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv install 2.7.9
pyenv global 2.7.9
pip install virtualenv

mkdir -p /opt/word-changer-web
base=/opt/word-changer-web

install -m 755 /home/source/word-changer-web $base/word-changer-web

virtualenv $base/.venv
source $base/.venv/bin/activate
pip install flask

install -m 755 /home/source/word-changer /usr/bin/word-changer

exit 0
