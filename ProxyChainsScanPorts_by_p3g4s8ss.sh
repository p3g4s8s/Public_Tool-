#!/bin/bash

# Número total de puertos a escanear
total_ports=65535

echo "Ingresa la IPv4 a escanear por medio de proxychains: "
read IP
echo "__________________________________"
echo -e "Escaneando puertos de la IP: \e[32m$IP\e[0m"

# Inicializar contador de puertos escaneados
scanned_ports=0

# Bucle para escanear los puertos
for port in $(seq 1 "$total_ports"); do
    # Realizar el escaneo del puerto
    proxychains -q timeout 2 bash -c "echo '' > /dev/tcp/$IP/$port" 2>/dev/null &&
    echo -e "\e[32m[+]\e[0m$port - OPEN" &
    # Incrementar el contador de puertos escaneados
    ((scanned_ports++))

    # Calcular el porcentaje completado
    percentage=$((scanned_ports * 100 / total_ports))

    # Mostrar el progreso en tiempo real
    echo -ne "\e[31mProgreso: $percentage%\e[0m Puerto:$port   \r"
done

# Esperar a que finalicen todos los procesos en segundo plano
wait

# Mostrar mensaje de finalización del escaneo
echo -e "\e[35mEscaneo completado\e[0m"
