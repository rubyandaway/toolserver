#!/bin/bash

# update server
sudo yum update -y
sudo yum install -y epel-release

# install java
sudo yum install -y java-1.8.0-openjdk-devel

# install jenkins
firewall-cmd — add-port=8080/tcp — permanent — zone=public
firewall-cmd — reload
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins

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




