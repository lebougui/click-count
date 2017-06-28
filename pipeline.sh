#! /bin/bash

curl -L https://bootstrap.saltstack.com -o /tmp/bootstrap_salt.sh
chmod +x /tmp/bootstrap_salt.sh

systemctl stop salt-minion

cp -rvf * /srv/.

salt-call --local pillar.items --retcode-passthrough
if [ "$?" == 0 ] 
then
    echo "pillars ok"
else
    echo "pillars error !"
    exit -1
fi

salt-call --local  state.apply clickcount -l debug --retcode-passthrough
if [ "$?" == 0 ] 
then
    echo "pipeline execution ok"
else
    echo "pipeline execution error !"
    exit -1
fi

