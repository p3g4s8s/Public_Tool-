|| Extract_Banners_SSH.sh ||

El fin de este script es para ejercicios de red team, donde se encuentra el servicio SSH en multiples dispositivos, por ende, para agilizar tiempos existe este script, el cual unicamente pasandole una lista de dispositivos con este servicios abierto, lo que hara es mostrar el banner que cada uno y asi identificar e ir por los dispositivos que posean informacion relevante.

./Extract_Banners_SSH.sh -h

-------------------------------------------------------------------------------<img width="949" alt="2024-04-03 15_04_07-Acselx bat_ Bloc de notas" src="https://github.com/p3g4s8s/Public_Tool-/assets/150304631/1f14d6ea-446f-4a3f-be30-eae6ea820f77">

|| poc_brute_force_JKS.py ||

python3 poc_brute_force_JKS.py

Debe modificarse las siguientes lineas:
4 --- contraseñas = "DICCIONARIO.TXT"

10 --- ruta_keytool = r"RUTA\JAVA_JDK\bin\keytool.exe"

12 --- ruta_jks = r"RUTA_JKS\NTORACOL01.jks"

Una vez modificado se puede ejecutar el comando anterior para obtener
