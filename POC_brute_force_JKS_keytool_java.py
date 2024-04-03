import subprocess

# Lista de contraseñas
contraseñas = "DICCIONARIO EN ARCHIVO TXT"

with open(contraseñas, "r") as archivo:
    contraseñas = archivo.read().splitlines()

# Ruta al archivo keytool.exe
ruta_keytool = r"RUTA ABSOLUTA KEY TOOL"
# Ruta al archivo NTORACOL01.jks
ruta_jks = r"RUTA ABSOLUTA JKS"

# Intentar cada contraseña
for contraseña in contraseñas:
    # Intentar ejecutar keytool con la contraseña actual
    proceso = subprocess.Popen([ruta_keytool, "-list", "-v", "-keystore", ruta_jks], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    salida, error = proceso.communicate(input=contraseña)
    
    # Comprobar si la contraseña fue correcta
    if proceso.returncode == 0:
        print("¡Contraseña correcta encontrada!")
        print("La contraseña es:", contraseña)
        break
    else:
        print("Contraseña incorrecta:", contraseña)
