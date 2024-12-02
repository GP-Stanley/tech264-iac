#!/bin/bash
set -e
set -x

# Minimal dependencies and setup
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    nginx \
    docker.io \
    conntrack

# Script permissions
sudo chmod +x /var/lib/cloud/instance/scripts/*

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install Minikube (single command download and install)
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && sudo install minikube /usr/local/bin/ \
    && rm minikube

# Start Minikube
minikube start --driver=docker --cpus=2 --memory=2048

# Clone and deploy
git clone https://github.com/GP-Stanley/spring-boot-k8s-app-db.git repo
cd repo 

# Deploy Kubernetes resources
kubectl apply -f database-definitions.yml
sleep 30
kubectl apply -f app-definitions.yml

# Get IPs
MINIKUBE_IP=$(minikube ip)
EC2_PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

# Configure Nginx
sudo tee /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    server_name $EC2_PUBLIC_IP;
    location / {
        proxy_pass http://$MINIKUBE_IP:30002;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

# Finalise Nginx
sudo nginx -t
sudo systemctl reload nginx

echo "Deployment complete on $EC2_PUBLIC_IP"