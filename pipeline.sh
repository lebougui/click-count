#! /bin/bash

curl -L https://bootstrap.saltstack.com -o /tmp/bootstrap_salt.sh
chmod +x /tmp/bootstrap_salt.sh

systemctl stop salt-minion

salt-call --local pillar.items

salt-call --local  state.apply -l debug
