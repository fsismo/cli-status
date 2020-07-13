#!/bin/bash
cd /opt/status
ln -s /opt/status/status-initd.bash /etc/init.d/CliStatus
update-rc.d CliStatus defaults
chmod +x /etc/init.d/CliStatus
systemctl enable CliStatus
systemctl start CliStatus
systemctl status CliStatus
cp config.ori.bash config.bash
echo config.bash > .gitignore
#git update-index --assume-unchanged config.bash
