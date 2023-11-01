sudo apt install python3-systemd
sudo mkdir -p /opt/voltbro
curl -L https://github.com/voltbro/explorer_units/archive/refs/tags/0.3.0.tar.gz -o explorer_units.tar.gz
sudo sh -c "mkdir -p /opt/voltbro && tar -xvzf explorer_units.tar.gz --directory /opt/voltbro --strip-components 1"
sudo chown -R pi:root /opt/voltbro
sudo chmod -R u+rwx,g+rwx,o+r /opt/voltbro
sudo rm explorer_units.tar.gz

cd /opt/voltbro
sudo chmod +x ./install.mjs
./install.mjs
