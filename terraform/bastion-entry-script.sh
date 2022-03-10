#!/usr/bin/env bash

sudo echo "Port 22" >> /etc/ssh/sshd_config
sudo echo "Port 12000" >> /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg
sudo apt install -y binutils
sudo apt install -y net-tools
sudo apt install -y inetutils-traceroute 

sudo apt install -y unzip
sudo apt install -y mc
sudo apt install -y nmap

#install git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt install -y git

#install Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install -y docker-ce
#sudo snap install docker

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker azureuser

#install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

#install eksctl
sudo curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz 
sudo mv eksctl /bin/eksctl

#install ansible
sudo apt install -y ansible 

#install terraform and packer
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt update && sudo apt install -y terraform
sudo apt update && sudo apt install -y packer


