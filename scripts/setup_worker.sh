#!/bin/bash

# 업데이트 및 필수 패키지 설치
sudo apt-get update -y
sudo apt-get install -y curl sshpass

# K3s Agent 설치
MASTER_IP="192.168.56.110"
TOKEN=$(sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@$MASTER_IP "sudo cat /var/lib/rancher/k3s/server/node-token")
curl -sfL https://get.k3s.io | K3S_URL=https://$MASTER_IP:6443 K3S_TOKEN=$TOKEN sh -