sudo apt install python3-systemd
curl -L https://github.com/voltbro/vbcores-units/archive/refs/tags/0.1.0.tar.gz -o vbcores-units.tar.gz
sudo sh -c "mkdir -p /opt/voltbro && tar -xvzf vbcores-units.tar.gz --directory /opt/voltbro --strip-components 1"
sudo chown $(whoami):root /opt/voltbro
sudo chmod -R u+rwx,g+rwx,o+r /opt/voltbro
zx /opt/voltbro/install.mjs
