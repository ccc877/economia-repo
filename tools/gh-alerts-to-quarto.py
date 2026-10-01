#!/usr/bin/env python3
"""Convierte los avisos con sintaxis de GitHub en callouts nativos de Quarto.

Motivo de existir: Quarto reconoce los callouts en su lector, es decir ANTES de
que corra cualquier filtro de Lua. Un filtro que construya el `Div` correcto
produce algo con la clase `callout-*` pero sin botón de plegado ni estilo real:
no es un callout, solo un `div` que se le parece. La única forma fiable de
obtener callouts de verdad es darle a Quarto la sintaxis `:::`.

Así que, en vez de un filtro, este script reescribe los ficheros de ejercicios
en un directorio de compilación y se renderiza desde ahí. Los ficheros fuente
siguen escribiéndose con sintaxis de GitHub, que es lo que interesa.

    > [!info] Título        se convierte en    ::: {.callout-note}
    > cuerpo                                    ## Título
    >                                           cuerpo
    >                                           :::
"""

import glob
import os
import re
import shutil
import sys

# Quarto solo reconoce CINCO tipos de callout: note, tip, important, warning y
# caution. Cualquier otro nombre (callout-example, callout-success…) no es un
# callout para Quarto: lo deja como un <section> normal, sin estilo ni botón de
# plegado. GitHub usa un conjunto más amplio, así que todo se recategoriza aquí.
# Las soluciones van a `tip` porque es el tipo que más se repite en el cuaderno.
TIPOS = {
    "note": "note",
    "info": "note",
    "abstract": "note",
    "quote": "note",
    "tip": "tip",
    "example": "tip",
    "success": "tip",
    "question": "tip",
    "important": "important",
    "todo": "important",
    "warning": "warning",
    "caution": "warning",
    "danger": "warning",
    "failure": "warning",
    "bug": "warning",
}

# `> [!tipo]`, con el sufijo opcional de plegado y el título del aviso.
AVISO = re.compile(r"^(\s*)>\s*\[!([A-Za-z][\w-]*)\]([+-]?)\s*(.*)$")
# Una línea cualquiera dentro del bloque citado: `> texto` o `>` sola.
CITADA = re.compile(r"^(\s*)>( ?)(.*)$")


def copiar_estaticos(origen, destino):
    """Copia los ficheros que no son Markdown, como los explainers interactivos."""
    for patron in ("*.html", "*.css", "*.js"):
        for ruta in glob.glob(os.path.join(origen, patron)):
            destino_fichero = os.path.join(destino, os.path.basename(ruta))
            shutil.copyfile(ruta, destino_fichero)
            print(f"  {os.path.basename(ruta)}: copiado sin convertir")


def convertir(origen, destino):
    os.makedirs(destino, exist_ok=True)
    total = 0

    for ruta in sorted(glob.glob(os.path.join(origen, "*.md"))):
        with open(ruta, encoding="utf-8") as f:
            lineas = f.read().split("\n")

        salida = []
        i = 0
        convertidos = 0

        while i < len(lineas):
            aviso = AVISO.match(lineas[i])
            if not aviso or aviso.group(2).lower() not in TIPOS:
                salida.append(lineas[i])
                i += 1
                continue

            sangria, tipo, sufijo, titulo = aviso.groups()
            attrs = [f".callout-{TIPOS[tipo.lower()]}"]
            if sufijo == "-":
                attrs.append('collapse="true"')
            elif sufijo == "+":
                attrs.append('collapse="false"')

            salida.append(f"{sangria}::: {{{' '.join(attrs)}}}")
            if titulo.strip():
                # `unlisted` mantiene el índice limpio: con un desplegable por
                # ejercicio, el índice se llenaría de soluciones.
                salida.append(
                    f"{sangria}## {titulo.strip()} {{.unlisted .unnumbered}}"
                )

            # Cuerpo del aviso: todo lo que siga citando con `>`.
            i += 1
            while i < len(lineas):
                citada = CITADA.match(lineas[i])
                if not citada:
                    break
                sangria_cuerpo, _, contenido = citada.groups()
                # Se conserva la sangría del bloque citado: si el aviso está
                # dentro de una lista, la fenced div debe quedarse dentro.
                salida.append(sangria_cuerpo + contenido)
                i += 1

            salida.append(f"{sangria}:::")
            convertidos += 1

        with open(os.path.join(destino, os.path.basename(ruta)), "w", encoding="utf-8") as f:
            f.write("\n".join(salida))

        if convertidos:
            print(f"  {os.path.basename(ruta)}: {convertidos} avisos")
            total += convertidos

    copiar_estaticos(origen, destino)

    # El _quarto.yml se copia con la ruta de salida ajustada al nuevo nivel de
    # anidamiento (build/ejercicios en vez de ejercicios).
    config_origen = os.path.join(origen, "_quarto.yml")
    if os.path.exists(config_origen):
        with open(config_origen, encoding="utf-8") as f:
            config = f.read()
        # Se conserva la sangría original: si `output-dir` se queda fuera de
        # `project:`, Quarto lo ignora en silencio y escribe en el sitio
        # equivocado.
        config = re.sub(
            r"^([ \t]*)output-dir:.*$",
            lambda m: f"{m.group(1)}output-dir: ../../_book/ejercicios",
            config,
            flags=re.M,
        )
        config = re.sub(r"^filters:\n(?:[ \t]*-.*\n)*", "", config, flags=re.M)
        with open(os.path.join(destino, "_quarto.yml"), "w", encoding="utf-8") as f:
            f.write(config)

    return total


if __name__ == "__main__":
    if len(sys.argv) != 3:
        sys.exit("Uso: gh-alerts-to-quarto.py <origen> <destino>")

    origen, destino = sys.argv[1], sys.argv[2]
    if os.path.isdir(destino):
        shutil.rmtree(destino)

    print(f"{convertir(origen, destino)} avisos convertidos a callouts nativos.")
