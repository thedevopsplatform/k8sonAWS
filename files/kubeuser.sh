#!/bin/bash

sudo -u ubuntu bash -c "cat /dev/zero | ssh-keygen -q -N ''"
sudo su -c "useradd ansibleuser -m -s /bin/bash"
sudo su -c "usermod -aG sudo ansibleuser"
sudo echo 'ansibleuser ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
sudo su - ansibleuser
sudo cp -r home/ubuntu/.ssh/ /home/ansibleuser/
sudo chown -R ansibleuser /home/ansibleuser/.ssh
sudo swapoff -a

sudo apt update --yes
sudo apt install -y apt-transport-https curl
sudo apt install python --yes

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt update && sudo apt install -y kubelet kubeadm kubectl docker.io
sudo systemctl enable docker

sudo sysctl -w net.ipv4.ip_forward=1
sudo sed -i -e "s/^$net.ipv4.ip_forward.*/net.ipv4.ip_forward=1/" /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

sudo hostnamectl set-hostname $(curl http://169.254.169.254/latest/meta-data/local-hostname)