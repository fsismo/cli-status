#!/bin/bash
cd /opt/status
ln -s /opt/status/status-initd.bash /etc/init.d/CliStatus
update-rc.d CliStatus defaults
chmod +x /etc/init.d/CliStatus
systemctl enable CliStatus
#systemctl start CliStatus
cp config.ori.bash config.bash
echo config.bash > .gitignore
echo -e "First you should set you api key from https://home.openweathermap.org/api_keys and your DNS servers in the config.bash file"
echo -e "To start the process you should run:\n \033[1;33m  sudo systemctl status CliStatus \033[0m"
