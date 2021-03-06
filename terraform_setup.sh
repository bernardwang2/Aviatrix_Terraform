#!/bin/bash
#setting up path for terraform
cd $HOME
mkdir $HOME/test-Aviatrix
mkdir $HOME/terraform

cd terraform
wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip?_ga=2.185301857.95159238.1514844249-2070037128.1513573039
sudo apt-get install -y zip unzip
unzip terraform_0.11.1_linux_amd64.zip?_ga=2.185301857.95159238.1514844249-2070037128.1513573039
sudo mv terraform /usr/local/bin/
terraform -version
#setting up path for GO
cd ~/home/terraform
wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
#setting up GOPATH
echo "export GOPATH=$HOME/work" > ~/.bash_profile
source ~/.bash_profile
export GOBIN=$HOME/work/bin
echo "export GOPATH=$HOME/work" > ~/.zshrc
source ~/.zshrc
#Building the Aviatrix Plugin
mkdir -p $GOPATH/src/github.com/terraform-providers
cd $GOPATH/src/github.com/terraform-providers
sudo apt install git 
git clone https://github.com/AviatrixSystems/terraform-provider-aviatrix.git
cd $GOPATH/src/github.com/terraform-providers/terraform-provider-aviatrix
sudo apt install make
make fmt
make build
echo 'providers {
  "aviatrix" = "$GOPATH/bin/terraform-provider-aviatrix"
  }' >> ~/.terraformrc
cd /home/ubuntu/test-Aviatrix
echo
pwd
echo $GOPATH
echo "Please manually source these files"
echo "source ~/.bash_profile"
echo "source ~/.zshrc"
echo "export PATH=$PATH:/usr/local/go/bin"
