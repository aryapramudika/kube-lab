#!/bin/bash

## Install kubectl,kubeadm,kubelet
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# Installasi
sudo apt update
sudo apt install -y kubeadm kubectl kubelet

#Jika ingin menginstall custom version, bisa seperti ini contohnya
sudo apt install -y kubeadm=1.23.00 kubectl=1.23.00 kubelet=1.23.00

# Untuk melihat nomor versi yang tersedia bisa menggunakan perintah
sudo apt-cache madison kubeadm

# Hold/keep version, berfungsi agar paket tersebut gak terupdate versi terbaru secara otomatis
sudo apt-mark hold kubelet kubeadm kubectl
