#!/bin/bash
ln -s /opt/status/status-initd.bash /etc/init.d/status-cli
update-rc.d status-cli defaults
update-rc.d status-cli enable
systemctl start status-cli
systemctl start status-cli
systemctl status status-cli
