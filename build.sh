#!/bin/bash -x

# unicorn api
api_conf="/home/source/unicorn_api.conf"
[ -e "$api_conf" ] && cp $api_conf /etc/

# app prereqs
apt-get update
apt-get install -y inotify-tools

# python build (pyenv)
 apt-get install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev
[ ! -d /opt/.pyenv ] && git clone https://github.com/yyuu/pyenv.git /opt/.pyenv
export PYENV_ROOT="/opt/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
yes n | pyenv install 2.7.9 || true
pyenv global 2.7.9

# virtualenv
pip install virtualenv

src=/home/source
dst=/opt/web
mkdir -p $dst
rm -rf $dst/.venv
virtualenv $dst/.venv
source $dst/.venv/bin/activate

# prereqs
pip install flask

# install
install -m 755 $src/etc/rc.local /etc
install -m 755 $src/word-changer-web $dst/word-changer-web
install -m 755 $src/word-changer /usr/bin/word-changer

exit 0
