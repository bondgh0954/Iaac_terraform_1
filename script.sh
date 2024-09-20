#!/bin/bash

sudo yum update -y && sudo yum install docker -y
sudo systemctl start docker 
sudo usermod -aG docker ec2-user
sudo docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
