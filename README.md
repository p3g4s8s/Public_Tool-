|| Extract_Banners_SSH.sh ||

El fin de este script es para ejercicios de red team, donde se encuentra el servicio SSH en multiples dispositivos, por ende, para agilizar tiempos existe este script, el cual unicamente pasandole una lista de dispositivos con este servicios abierto, lo que hara es mostrar el banner que cada uno y asi identificar e ir por los dispositivos que posean informacion relevante.

./Extract_Banners_SSH.sh -h

-------------------------------------------------------------------------------

|| poc_brute_force_JKS.py ||

python3 poc_brute_force_JKS.py

Debe modificarse las siguientes lineas:
4 --- contraseñas = "DICCIONARIO.TXT"

10 --- ruta_keytool = r"RUTA\JAVA_JDK\bin\keytool.exe"

12 --- ruta_jks = r"RUTA_JKS\COL01.jks"

<img width="378" alt="GITHUB_POC" src="https://github.com/p3g4s8s/Public_Tool-/assets/150304631/ae746112-b4f4-4a42-a89f-0399a62ce33a">

Una vez modificado se puede ejecutar el comando anterior para obtener

|| Escanear puertos mediante proxychains ||

Simplemente abra que descargarlo, darles permisos de ejecucion cn chmod +x y posterior a ello ejecutarlo, indicandole la IP para realizar el respectivo escaneo de puertos, alli te ira dando el progreso en tiempo real, el puerto abierto es el primero ya que el segundo es unicamente el estado en el que se encontraba al momento de encontrar el puerto.
![image](https://github.com/p3g4s8s/Public_Tool-/assets/150304631/cc953cb7-a800-4e27-a0c5-3797ddeb91d3)

Por defecto se encuentra configurado para escanear desde el 1 - 65535.
