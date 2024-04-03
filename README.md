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
