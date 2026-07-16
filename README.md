# 🚀 Uptime Kuma Installer

Simple installer untuk menginstal **Uptime Kuma** menggunakan Docker beserta **Nginx Reverse Proxy + SSL (Let's Encrypt)** pada Ubuntu & Debian.

---

# ✨ Features

### Uptime Kuma Installer

* ✅ Auto Install Docker
* ✅ Auto Install Uptime Kuma
* ✅ Auto Create Docker Volume
* ✅ Auto Restart on Boot
* ✅ Open Firewall Port 3001 (UFW)
* ✅ Detect Public IP
* ✅ Support Ubuntu 20.04 / 22.04 / 24.04
* ✅ Support Debian 11 / 12

### Nginx & SSL Installer

* ✅ Auto Install Nginx
* ✅ Auto Install Certbot
* ✅ Auto Configure Reverse Proxy
* ✅ Auto Enable HTTPS
* ✅ Auto Redirect HTTP → HTTPS
* ✅ Support Cloudflare
* ✅ Access Uptime Kuma Without Port `3001`

---

# 📦 Installation

### Install Uptime Kuma

```bash
bash <(curl -Ls https://raw.githubusercontent.com/arivpnstores/kuma-installer/main/install.sh)
```

atau

```bash
wget -qO- https://raw.githubusercontent.com/arivpnstores/kuma-installer/main/install.sh | bash
```

---

### Install Nginx Reverse Proxy + SSL

```bash
bash <(curl -Ls https://raw.githubusercontent.com/arivpnstores/kuma-installer/main/nginx.sh)
```

atau

```bash
wget -qO- https://raw.githubusercontent.com/arivpnstores/kuma-installer/main/nginx.sh | bash
```

---

# 🌐 Access Dashboard

### Sebelum Reverse Proxy

```
http://YOUR_SERVER_IP:3001
```

### Setelah Reverse Proxy + SSL

```
https://your-domain.com
```

---

# 🌍 Public Status Page

Buat **Status Page** agar pelanggan dapat melihat status server tanpa login.

Contoh:

```
https://your-domain.com/status/vpn
```

---

# 📊 Supported Monitor

Uptime Kuma mendukung berbagai monitor seperti:

* HTTP / HTTPS
* TCP Port
* Ping (ICMP)
* DNS
* Docker
* MQTT
* Steam Game Server
* Push Monitor
* gRPC
* dan masih banyak lagi.

---

# 📱 Notifications

Mendukung lebih dari 90 layanan notifikasi.

Di antaranya:

* Telegram
* Discord
* Slack
* Email (SMTP)
* Webhook
* Microsoft Teams
* Gotify
* Pushover
* Ntfy
* Signal
* Matrix
* dan lainnya.

---

# 🐳 Docker Commands

### Status

```bash
docker ps
```

### Restart

```bash
docker restart uptime-kuma
```

### Stop

```bash
docker stop uptime-kuma
```

### Logs

```bash
docker logs uptime-kuma
```

### Update

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

# ❌ Uninstall

```bash
docker stop uptime-kuma
docker rm uptime-kuma
docker volume rm uptime-kuma
```

---

# ☁️ Cloudflare Recommendation

Untuk penggunaan Cloudflare:

* Install Uptime Kuma terlebih dahulu.
* Jalankan `nginx.sh`.
* Buat DNS Record (A Record) mengarah ke IP VPS.
* Setelah SSL berhasil, ubah **Proxy Status** menjadi **Proxied (Orange Cloud)**.
* Gunakan mode SSL **Full (Strict)**.

---

# 📖 Official Project

* Uptime Kuma GitHub: https://github.com/louislam/uptime-kuma
* Documentation: https://github.com/louislam/uptime-kuma/wiki

---

# 👨‍💻 Author

**PT RAJA SERVER PREMIUM**

GitHub: https://github.com/arivpnstores

---

⭐ If this project helps you, don't forget to **Star** this repository.
