#!/bin/bash

## Install kubectl,kubeadm,kubelet
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# Installasi
sudo apt-get update
sudo apt-get install -y kubeadm kubectl
# Hold/keep version, berfungsi agar paket tersebut gak terupdate versi terbaru secara otomatis
sudo apt-mark hold kubelet kubeadm kubectl
