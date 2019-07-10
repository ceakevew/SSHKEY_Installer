#/bin/sh
apt update -y
apt install curl -y
yum clean all
yum make cache
yum install curl -y
echo 'welcome'
cd ~
mkdir .ssh
cd .ssh
curl https://raw.githubusercontent.com/ceakevew/SSHKEY_Installer/master/1.keys > authorized_keys
chmod 700 authorized_keys
cd ../
chmod 600 .ssh
cd /etc/ssh/

sed -i "/PasswordAuthentication no/c PasswordAuthentication no" sshd_config
sed -i "/RSAAuthentication no/c RSAAuthentication yes" sshd_config
sed -i "/PubkeyAuthentication no/c PubkeyAuthentication yes" sshd_config
sed -i "/PasswordAuthentication yes/c PasswordAuthentication no" sshd_config
sed -i "/RSAAuthentication yes/c RSAAuthentication yes" sshd_config
sed -i "/PubkeyAuthentication yes/c PubkeyAuthentication yes" sshd_config
service sshd restart
service ssh restart
systemctl restart sshd
systemctl restart ssh
cd ~
rm -rf key.sh
