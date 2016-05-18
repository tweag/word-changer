#!/bin/bash

install -m 755 /home/source/etc/rc.local /etc
install -m 644 /home/source/etc/default.apache_template /etc/default.apache_template
install -m 644 /home/source/etc/ports.conf.apache_template /etc/ports.conf.apache_template
cp /home/source/var/www/index.html /var/www/index.html
api_conf="/home/source/unicorn_api.conf"
[ -e "$api_conf" ] && cp $api_conf /etc/

exit 0
