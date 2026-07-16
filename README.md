# kuma-installer# 🚀 Uptime Kuma Installer

Simple installer untuk menginstal **Uptime Kuma** menggunakan Docker pada **Ubuntu & Debian**.

## ✨ Features

* ✅ Auto Install Docker
* ✅ Auto Install Uptime Kuma
* ✅ Auto Create Docker Volume
* ✅ Auto Restart on Boot
* ✅ Open Firewall Port 3001 (UFW)
* ✅ Detect Public IP
* ✅ Support Ubuntu 20.04 / 22.04 / 24.04
* ✅ Support Debian 11 / 12

---

## 📦 Installation

Jalankan satu perintah berikut:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/arivpnstores/kuma-installer/main/install.sh)
```

atau

```bash
wget -qO- https://raw.githubusercontent.com/arivpnstores/kuma-installer/main/install.sh | bash
```

---

## 🌐 Access Dashboard

Setelah instalasi selesai, buka browser:

```
http://YOUR_SERVER_IP:3001
```

Pada login pertama, buat akun administrator.

---

## 📊 Features

Uptime Kuma mendukung monitoring:

* HTTP / HTTPS
* TCP Port
* Ping (ICMP)
* DNS
* Steam Game Server
* Docker
* Push Monitor
* MQTT
* dan berbagai monitor lainnya.

---

## 📱 Notifications

Uptime Kuma mendukung lebih dari 90 layanan notifikasi, seperti:

* Telegram
* Discord
* Slack
* Email (SMTP)
* Webhook
* Gotify
* Microsoft Teams
* Pushover
* dan lainnya.

---

## 🌍 Public Status Page

Buat **Status Page** agar pelanggan dapat melihat status server tanpa login.

Contoh:

```
https://status.domain.com/status/vpn
```

---

## 🐳 Docker Commands

Melihat status container:

```bash
docker ps
```

Restart:

```bash
docker restart uptime-kuma
```

Stop:

```bash
docker stop uptime-kuma
```

Update:

```bash
docker pull louislam/uptime-kuma:2
docker stop uptime-kuma
docker rm uptime-kuma

docker run -d \
  --name uptime-kuma \
  --restart always \
  -p 3001:3001 \
  -v uptime-kuma:/app/data \
  louislam/uptime-kuma:2
```

---

## ❌ Uninstall

```bash
docker stop uptime-kuma
docker rm uptime-kuma
docker volume rm uptime-kuma
```

---

## 📖 Official Project

* Uptime Kuma GitHub: https://github.com/louislam/uptime-kuma
* Documentation: https://github.com/louislam/uptime-kuma/wiki

---

## 👨‍💻 Author

**ARI VPN STORE**

GitHub: https://github.com/arivpnstores

---

⭐ If this project helps you, don't forget to give it a **Star**.
