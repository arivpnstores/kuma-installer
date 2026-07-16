#!/bin/bash

clear

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}      UPTIME KUMA NGINX INSTALLER${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run as root!${NC}"
    exit 1
fi

read -p "Input Domain : " DOMAIN
read -p "Input Email  : " EMAIL

echo
echo -e "${YELLOW}[1/7] Installing Nginx...${NC}"

apt update -y
apt install nginx -y

echo -e "${YELLOW}[2/7] Removing Apache (if installed)...${NC}"

systemctl stop apache2 >/dev/null 2>&1
systemctl disable apache2 >/dev/null 2>&1
apt purge apache2 apache2-* -y >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1

echo -e "${YELLOW}[3/7] Installing Certbot...${NC}"

apt install certbot python3-certbot-nginx -y

echo -e "${YELLOW}[4/7] Creating Nginx Configuration...${NC}"

cat > /etc/nginx/sites-available/uptime-kuma <<EOF
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:3001;

        proxy_http_version 1.1;

        proxy_set_header Host \$host;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;

        proxy_read_timeout 60s;
    }
}
EOF

ln -sf /etc/nginx/sites-available/uptime-kuma /etc/nginx/sites-enabled/uptime-kuma

rm -f /etc/nginx/sites-enabled/default

echo -e "${YELLOW}[5/7] Testing Nginx...${NC}"

nginx -t

if [ $? -ne 0 ]; then
    echo -e "${RED}Nginx configuration error!${NC}"
    exit 1
fi

systemctl restart nginx

echo -e "${YELLOW}[6/7] Installing SSL...${NC}"

certbot --nginx \
-d $DOMAIN \
--agree-tos \
-m $EMAIL \
--redirect \
--non-interactive

echo -e "${YELLOW}[7/7] Reloading Nginx...${NC}"

systemctl reload nginx

clear

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}        INSTALL COMPLETED${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo
echo -e "Dashboard : https://$DOMAIN"
echo
echo -e "Public Status Page:"
echo -e "https://$DOMAIN/status/<slug>"
echo
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
