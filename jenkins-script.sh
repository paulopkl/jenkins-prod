#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update -y && sudo apt upgrade -y

# Install Java (minimum version required for Jenkins)
echo "Installing Java 17..."
sudo apt install -y openjdk-17-jdk

# Install dependencies for Jenkins
echo "Adding Jenkins repository and installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git
echo "Installing Git..."
sudo apt install -y git

# Install Terraform
echo "Installing Terraform..."
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install -y terraform

# Install Kubectl
echo "Installing Kubectl..."
KUBECTL_VERSION="v1.23.6"
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl  # Clean up downloaded file

# Verify installations
echo "Verifying installations..."
jenkins --version || echo "Jenkins version check failed"
git --version || echo "Git version check failed"
terraform --version || echo "Terraform version check failed"
kubectl version --client || echo "Kubectl version check failed"

echo "All installations completed successfully!"
