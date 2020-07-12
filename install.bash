#!/bin/bash
ln -s /opt/status/status-initd.bash /etc/init.d/CliStatus
update-rc.d CliStatus defaults
chmod +x /etc/init.d/CliStatus
systemctl enable CliStatus
systemctl start CliStatus
systemctl status CliStatus
