sudo apt install python3-systemd
sudo mkdir -p /opt/voltbro
curl -L https://github.com/voltbro/vbcores-units/archive/refs/tags/0.3.0.tar.gz -o vbcores-units.tar.gz
sudo sh -c "mkdir -p /opt/voltbro && tar -xvzf vbcores-units.tar.gz --directory /opt/voltbro --strip-components 1"
sudo chown -R pi:root /opt/voltbro
sudo chmod -R u+rwx,g+rwx,o+r /opt/voltbro

cd /opt/voltbro
sudo chmod +x ./install.mjs
./install.mjs
