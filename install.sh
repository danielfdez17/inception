#!/bin/bash

echo "Updating package lists..."
sudo apt update && sudo apt upgrade -y

echo "Installing Visual Studio Code..."
sudo snap install --classic code

echo "Installing Git..."
sudo apt install git -y

echo "Installing Docker"
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSl https://download.docker.com/linux/ubuntu/gpg | tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo docker run hello-world (check if it is installed)
sudo usermod -aG docker $USER (to run docker without sudo)
newgrp docker
docker ps
sudo systemctl enable docker

echo "Installing make"
sudo apt install make -y

echo "Installing docker-compose"
sudo apt install docker-compose -y

echo "Checking Python version"
python3 --version

echo "Installing Python pip"
sudo apt install python3-pip -y

echo "Installing distutils"
pip install distutils

echo "Installing Vim"
sudo apt install vim -y
