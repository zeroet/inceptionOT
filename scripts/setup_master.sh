#!/bin/bash

# 업데이트 및 필수 패키지 설치
sudo apt-get update -y
sudo apt-get install -y curl sshpass

# K3s 설치 (Master Node)
curl -sfL https://get.k3s.io | sh -

# kubectl 설정
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config