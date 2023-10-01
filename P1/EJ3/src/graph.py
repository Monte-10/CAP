import subprocess
import time
import matplotlib.pyplot as plt
import os

list_images = ["images/SD.jpg", "images/HD.jpg", "images/FHD.jpg", "images/4K.jpg", "images/8K.jpg"]
list_images_grey = ["images/SD_grey.jpg", "images/HD_grey.jpg", "images/FHD_grey.jpg", "images/4K_grey.jpg", "images/8K_grey.jpg"]

def ejecutar_programa(programa, imagen):
    comando = f"./{programa} {imagen}"
    resultado = subprocess.check_output(comando, shell=True, text=True)
    lineas = resultado.split('\n')
    for linea in lineas:
        if "Tiempo:" in linea:
            tiempo = float(linea.split("Tiempo:")[1].strip())
            return tiempo

tiempo_intrinsics = []
tiempo_normal = []
tiempo_autovectorized = []

for imagen in list_images:
    tiempo_normal.append(ejecutar_programa("greyScale", imagen))
    # Esperar un momento para evitar problemas de medición
    time.sleep(1)

for imagen in list_images:
    tiempo_autovectorized.append(ejecutar_programa("greyScale_autovectorized", imagen))
    # Esperar un momento para evitar problemas de medición
    time.sleep(1)

for imagen in list_images:
    tiempo_intrinsics.append(ejecutar_programa("greyScale_intrinsics", imagen))
    # Esperar un momento para evitar problemas de medición
    time.sleep(1)

# Generar gráficas de barras comparativas
programas = ["Normal", "AutoVectorized", "Intrinsics"]

plt.bar(programas, tiempo_normal, label='Normal', alpha=0.7)
plt.bar(programas, tiempo_autovectorized, label='AutoVectorized', alpha=0.7)
plt.bar(programas, tiempo_intrinsics, label='Intrinsics', alpha=0.7)

plt.xlabel("Programas")
plt.ylabel("Tiempo (segundos)")
plt.title("Comparación de Tiempos entre las Versiones de greyScale")
plt.legend()
plt.show()
