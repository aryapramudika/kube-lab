# Pre install, kita harus mengaktifkan beberapa modul di kernel yaitu overlay, dan br_netfilter
sudo cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# Aktifkan secara langsung dengan modprobe

sudo modprobe overlay br_netfilter

# Lalu kita perlu aktifin beberapa parameter di kernel seperti ip_forward, dsb. dibawah ini
sudo cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Aktifkan dengan cara direload
sudo sysctl --system


# Disini saya pakai containerd untuk container-runtimenya, berikut perintah installasinya
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Menambah GPG dari docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Menamabh repository docker
sudo echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install containerd
sudo apt update
sudo apt install containerd.io -y

# Buat konfigurasi containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# Restart containerd
sudo systemctl restart containerd
