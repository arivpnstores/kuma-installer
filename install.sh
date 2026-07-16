#!/bin/bash

clear
echo "======================================="
echo "      UPTIME KUMA INSTALLER"
echo "======================================="

# Root check
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root!"
    exit 1
fi

echo "[INFO] Updating package..."
apt update -y

# Install Docker jika belum ada
if ! command -v docker >/dev/null 2>&1; then
    echo "[INFO] Installing Docker..."

    apt install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/debian/gpg \
        | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
      > /etc/apt/sources.list.d/docker.list

    apt update -y

    apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    systemctl enable docker
    systemctl start docker
else
    echo "[OK] Docker already installed."
fi

# Hapus container lama
if docker ps -a --format '{{.Names}}' | grep -q "^uptime-kuma$"; then
    echo "[INFO] Removing old container..."
    docker stop uptime-kuma >/dev/null 2>&1
    docker rm uptime-kuma >/dev/null 2>&1
fi

# Volume
docker volume create uptime-kuma >/dev/null 2>&1

echo "[INFO] Pulling latest image..."
docker pull louislam/uptime-kuma:latest

echo "[INFO] Starting Uptime Kuma..."

docker run -d \
  --name uptime-kuma \
  --restart always \
  -p 3001:3001 \
  -v uptime-kuma:/app/data \
  louislam/uptime-kuma:latest

# UFW
if command -v ufw >/dev/null 2>&1; then
    ufw allow 3001/tcp >/dev/null 2>&1
fi

IP=$(curl -4 -s https://api.ipify.org)

echo ""
echo "======================================="
echo " INSTALL SUCCESS"
echo "======================================="
echo ""
echo "Dashboard : http://$IP:3001"
echo ""
echo "Login pertama akan diminta membuat akun admin."
echo ""
echo "======================================="
