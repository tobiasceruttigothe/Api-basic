#!/bin/bash

cp /usr/local/psi-ws-api/install/psi-ws-api.service /etc/systemd/system
cp /usr/local/psi-ws-api/conf/psi-ws-api.conf.sample /usr/local/psi-ws-api/conf/psi-ws-api.conf
systemctl daemon-reload
systemctl enable psi-ws-api
systemctl start psi-ws-api

# copiar cron.daily
# revisar PS1 en bash
# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 "\[\e[1;33m\](%s)\[\e[0m\]")$ '

