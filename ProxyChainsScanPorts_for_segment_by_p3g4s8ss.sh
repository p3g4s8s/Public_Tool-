#!/bin/bash

echo "Ingresa los 3 primeros octetos a escanear por medio de proxychains: [10.1.1]"
read IP
echo "Escaneando puertos de la IP: $IP"
for port in 21 22 25 80 88 443 445 8080 8081; do
        for i in $(seq 1 254); do
                proxychains -q timeout 2 bash -c "echo '' > /dev/tcp/$IP.$i/$port" 2>/dev/null && echo "[+]$port - OPEN on host $IP.$i" &
        done; wait
done
