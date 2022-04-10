#!/bin/bash

# update server
sudo yum update -y
sudo yum install -y epel-release

# install java
sudo yum install java-11-openjdk

# install maven
sudo yum install -y maven


# install ansible
sudo amazon-linux-extras install ansible2 -y

# install git
sudo yum install -y git

# install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins

firewall-cmd — add-port=8080/tcp — permanent — zone=public
firewall-cmd — reload


