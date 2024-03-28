#!/bin/bash


sudo apt install -y openjdk-17-jdk

# Download and Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get -y install jenkins


# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins to run on Boot
sudo systemctl enable jenkins
