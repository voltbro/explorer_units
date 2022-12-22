sudo apt install python3-systemd
sudo mkdir -p /opt/voltbro
curl -L https://github.com/voltbro/vbcores-units/archive/refs/tags/0.2.0.tar.gz -o vbcores-units.tar.gz
sudo sh -c "mkdir -p /opt/voltbro && tar -xvzf vbcores-units.tar.gz --directory /opt/voltbro --strip-components 1"
sudo chown -R $(whoami):root /opt/voltbro
sudo chmod -R u+rwx,g+rwx,o+r /opt/voltbro

sudo mkdir -p /etc/systemd/system
sudo rm -f /etc/systemd/system/board.service
sudo ln -s /opt/voltbro/board/board.service /etc/systemd/system/board.service
sudo systemctl daemon-reload
