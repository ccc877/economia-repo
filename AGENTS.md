# AGENTS.md — Guía para agentes de código (Codex y similares)

Este repositorio contiene los apuntes de **Economía de 1.º de Bachillerato**, organizados
como un **proyecto Quarto book**: cada tema es un archivo `.qmd` independiente, agrupado
en 6 unidades didácticas, que se compila tanto a **HTML** (la versión web, publicada con
GitHub Pages) como a **PDF** (el libro completo, con LaTeX).

Antes de tocar nada, lee este documento entero. Contiene decisiones de estilo y varios
workarounds no evidentes que costó bastante descubrir; ignorarlos hace que el PDF salga
con tablas descolocadas, símbolos rotos o texto en inglés donde debería ir en español.

## 1. Estructura del repositorio

```
_quarto.yml          # Configuración del libro: formatos, unidades (parts), capítulos
index.qmd             # Landing del sitio: apuntes, ejercicios y documentos
tema-01.qmd … tema-14.qmd   # Un archivo por tema, cada uno UN SOLO capítulo (un único "# Título" H1)
ejercicios/           # PROYECTO QUARTO APARTE (tiene su propio _quarto.yml), ver más abajo
tools/                # Scripts que preparan el contenido antes de renderizar
render.sh              # Pipeline de renderizado completo (HTML + PDF), ver sección 4
.github/workflows/      # CI: renderiza a HTML y publica en GitHub Pages en cada push a main
```

Hay **dos proyectos Quarto distintos** en el mismo repositorio, y conviene no confundirlos:

- **El libro** (`_quarto.yml` en la raíz): los apuntes, `tema-NN.qmd`. Va a `_book/`.
- **Los ejercicios** (`ejercicios/_quarto.yml`): proyecto propio de tipo `book`, que
  renderiza dentro de `_book/ejercicios/`. Los ejercicios **no** son capítulos del
  libro ni un apéndice suyo: son una sección aparte del sitio, enlazada desde la
  landing.

Y dentro de cada uno, dos tipos de contenido con reglas distintas:

- **Los apuntes** (`tema-NN.qmd`) son el libro de texto: obligatoriamente `.qmd`, con su
  *chunk* de R y siguiendo todo lo de la sección 3.
- **Los ejercicios** (`ejercicios/*.md`) son material de trabajo: van en **Markdown plano
  (`.md`)**, no necesitan chunk de R. Puedes escribirlos como los escribes en GitHub; el
  paso de preparación de la sección 4 se encarga de la interoperabilidad.

Cada `tema-NN.qmd` empieza con el mismo *chunk* de configuración:

```r
#| label: setup
#| include: false
library(ggplot2)
library(knitr)
library(kableExtra)
```

seguido de un único encabezado `# Título del tema` (nivel 1). Los apartados internos usan
`##`, `###`, etc. Quarto numera los capítulos automáticamente según el orden en
`_quarto.yml`; **no** pongas "Tema 3." dentro del propio título del `.qmd" — eso ya lo pone
Quarto solo, y ponerlo a mano hace que se duplique o se desincronice si luego se reordena
el libro (ha pasado más de una vez).

Las 6 unidades didácticas se declaran en `_quarto.yml` mediante bloques `part:`. Si
añades o mueves un tema, actualiza también su bloque `part` correspondiente.

Los ejercicios se declaran en `ejercicios/_quarto.yml`, agrupados por `part:` (y también
en el `sidebar:` del mismo proyecto, para que el índice lateral cuadre). Ahí **no** puedes
anidar un `part:` dentro de otro: pon cada bloque a nivel superior. Nómbralos en minúsculas
y con guiones (`9-1-umbral-basico.md`), porque el nombre del archivo acaba en la URL; los
espacios y las tildes en el nombre se rompen. El proyecto de ejercicios necesita un
`index.md` como portada, siempre.

### Cómo es un ejercicio

Todo el material va **orientado al alumnado**, sin excepciones:

- El **título del documento no lleva numeración** ni prefijos tipo «6.1» o «Bloque 3»:
  un título limpio y legible (`# La productividad de los factores productivos`). La
  numeración es un residuo de cómo se ordenaron los apuntes al copiarlos, y descoloca
  al alumno que busca por el índice.
- Cada ejercicio lleva **su propio desplegable de solución** justo debajo del
  enunciado, con la forma exacta `> [!example]- Solución`. Nada de un bloque único de
  soluciones al final: el alumno debe poder comprobar uno sin ver los demás.
- No hay solucionarios en ficheros aparte ni «guías docentes»: el material es el
  mismo para quien lo resuelve y para quien lo corrige. Nada de mencionar al
  profesorado ni de escribir comentarios del tipo «esto sirve para comprobar si el
  alumnado…».
- El **convertidor marca los títulos como `unlisted`**, así que no ensucian el
  índice. Si añades un desplegable nuevo, hereda ese comportamiento automáticamente.

## 2. Entorno necesario

Este contenedor **no trae preinstalado** nada de lo siguiente; instálalo antes de
renderizar por primera vez:

- **Quarto CLI** (descargar el `.deb` de `github.com/quarto-dev/quarto-cli/releases/latest`
  e instalar con `dpkg -x` si no hay red a `packagecloud`/apt).
- **R** con los paquetes `ggplot2`, `knitr`, `kableExtra` (`apt-get install r-base-core` +
  `install.packages(...)`, o los paquetes `r-cran-*` de Ubuntu si no hay red a CRAN).
- **Para compilar a PDF únicamente**: una distribución LaTeX completa (`texlive-latex-base`,
  `texlive-latex-recommended`, `texlive-latex-extra`, `texlive-fonts-extra`,
  `texlive-luatex`, `texlive-plain-generic` — este último trae `ulem.sty`, que
  `kableExtra` necesita y que sorprendentemente no viene en los paquetes "grandes"—.
  El motor de PDF es `lualatex`.
- Fija siempre el *locale* al renderizar. Ojo: **`C.utf8` es el nombre de Linux y en
  macOS no existe**, así que R arranca con `LC_CTYPE=C` y trunca los caracteres acentuados
  del código (`<text>:2:14: unexpected input`). En macOS el correcto es `C.UTF-8`. El
  `render.sh` lo detecta solo, pero si renderizas a mano usa `LANG=C.UTF-8 LC_ALL=C.UTF-8`.

**La versión HTML no necesita LaTeX en absoluto.** Si solo vas a trabajar en la web,
basta con Quarto + R (ver `.github/workflows/publish.yml`, que usa exactamente eso).

## 3. Guía de estilo del contenido

- **Español de España, normativa de la RAE estricta**, especialmente en comillas
  («») y en títulos.
- Tono neutro y preciso; nivel adaptado a 1.º de Bachillerato (explicaciones claras,
  sin dar por supuesto vocabulario técnico no introducido antes).
- Prosa narrativa con ejemplos concretos, evitando el estilo "manual genérico de IA":
  nada de acumular bullets donde cabe una explicación en prosa, nada de reescribir cada
  párrafo con la misma cadencia. El tema 1 (`tema-01.qmd`) es la referencia de tono a
  imitar si tienes dudas.
- Minimiza los archivos externos: todo el contenido —incluidos gráficos y tablas— vive
  dentro del propio `.qmd`, generado con R (`ggplot2` para gráficos, `kable` +
  `kableExtra` para tablas), para que se renderice igual en HTML y en PDF.

### Callouts

- `.callout-note` con `### Definición` → definiciones formales.
- `.callout-important` → leyes económicas, matices importantes ("Nota").
- `.callout-tip` → ejemplos, casos reales, ejercicios resueltos.
- `.callout-warning` → avisos (contenido pendiente, matices que rompen una regla general).

**Sintaxis de GitHub también vale.** El script `tools/gh-alerts-to-quarto.py` (lo ejecuta
`render.sh` antes de renderizar, ver sección 4) traduce los avisos de GitHub a callouts
nativos, así que en los ejercicios puedes escribir como en GitHub y sale igual de bien:

```markdown
> [!tip] Título          se convierte en    ::: {.callout-tip}
> cuerpo                                    ## Título
>                                           cuerpo
>                                         :::
```

**Por qué un script y no un filtro de Lua** (costó bastante averiguarlo): Quarto
reconoce los callouts **en su lector**, es decir ANTES de que corra cualquier filtro. Un
filtro que construya el `div` correcto produce algo con la clase `callout-*` pero sin
estilo ni botón de plegado: no es un callout, solo un `div` que se le parece. La única
forma fiable de tener callouts de verdad es darle a Quarto la sintaxis `:::`. Por eso el
script reescribe los ficheros en `build/ejercicios/` y se renderiza desde ahí; los
ficheros fuente se siguen escribiendo con sintaxis de GitHub.

⚠️ **Quarto solo reconoce cinco tipos de callout: `note`, `tip`, `important`, `warning` y
`caution`.** Cualquier otro (`callout-example`, `callout-success`…) no es un callout para
Quarto: lo deja como un `<section>` normal, sin estilo y **sin botón de plegado**, y no da
ningún error. El script `TIPOS` recategoriza los tipos de GitHub a esos cinco; si añades
uno nuevo, mapea lo a un tipo real o el aviso saldrá sin plegar y parece que el bug es
del convertidor.

`[!info]` se mapea a `callout-note` (GitHub y Quarto lo llaman distinto) y las soluciones
(`[!example]`) a `callout-tip`. Un sufijo `-` deja el callout plegado y `+` desplegado pero
plegable. Un tipo ausente en el mapa hace que el aviso se descarte **en silencio** y salga
como texto entrecomillado plano.

⚠️ **Si el cuerpo de un aviso empieza con una lista o una tabla, pon una línea `>`
vacía justo después del título.** Sin ella Pandoc interpreta la lista como
continuación del párrafo del título y sale como texto plano con los `*` y los `1.`
a la vista. Esto ya pasó y es fácil de no ver en el código.

⚠️ **Ojo con los dos espacios al final de línea.** Markdown los interpreta como un salto
de línea forzado, y si la línea siguiente es un aviso sangrado (`  > [!tip] ...`) deja de
ser un bloque y se pega al párrafo anterior como texto literal. Quítalos.

Evita dos callouts pegados sin ninguna frase de transición entre ellos: en LaTeX, en
alguna combinación con figuras flotantes cercanas, han llegado a solaparse visualmente.
Basta una frase de enlace entre uno y otro para que no ocurra.

### Tablas

Patrón estándar para cualquier tabla:

```r
kable(df, format = if (knitr::is_latex_output()) "latex" else "html", booktabs = TRUE,
      col.names = c(...)) |>
  kable_styling(full_width = FALSE, bootstrap_options = c("striped", "hover"),
                latex_options = c("scale_down", "hold_position"))
```

El `format = if (knitr::is_latex_output()) ...` **no es opcional**: sin él, `kable()` no
detecta bien el formato de salida dentro de un proyecto *book* y la tabla pierde todo el
estilado en LaTeX (puede llegar a desbordar la página sin avisar).

⚠️ **`hold_position` / `HOLD_position` de kableExtra NO funcionan en tablas con
referencia cruzada de Quarto** (`#| label: tbl-...` + `#| tbl-cap: ...`). Quarto envuelve
esas tablas en su propio entorno flotante y descarta el `[H]` que kableExtra intenta
insertar. Es un problema real y confirmado (ver sección 4: el pipeline de renderizado lo
corrige con un `sed` posterior sobre el `.tex`). No pierdas tiempo intentando arreglarlo
solo cambiando `latex_options`.

### Figuras

- Genera los gráficos con `ggplot2` dentro del propio *chunk*.
- Añade siempre `#| fig-pos: 'H'` en figuras que estén ancladas a un párrafo o
  apartado concreto (si no, LaTeX puede desplazarlas a la sección siguiente, apareciendo
  bajo un título que no les corresponde — bug real, ya ocurrió).
- Cuidado con caracteres especiales **dentro del código R que dibuja el gráfico**
  (`labs()`, `annotate()`, `geom_text()`): el símbolo `€` y los subíndices Unicode
  (`₀`, `₁`...) se rompen al renderizar el *plot* a PDF, aunque esos mismos caracteres
  funcionan perfectamente dentro de tablas `kable()` o en el texto normal del documento.
  Usa palabras completas ("euros", "Demanda inicial") en vez de esos símbolos dentro de
  gráficos.
- Si añades ejes manuales con flechas (en vez de depender del tema de `ggplot2`), deja
  margen suficiente entre las etiquetas de los ejes y las puntas de flecha — se han
  solapado más de una vez.

## 4. Cómo renderizar

Usa `render.sh`, que encapsula el pipeline completo (ver el propio script para el
detalle). Resumen:

```bash
./render.sh html   # solo la web (rápido, sin LaTeX): libro + ejercicios
./render.sh pdf    # el libro en PDF (requiere el entorno LaTeX completo)
./render.sh all    # ambos
```

El paso de HTML hace, en este orden:

1. `quarto render --to html` del libro (que borra `_book/` entero).
2. `python3 tools/gh-alerts-to-quarto.py ejercicios build/ejercicios` — traduce la
   sintaxis de GitHub a callouts nativos. El script copia el `_quarto.yml` ajustando
   `output-dir` a `../../_book/ejercicios` (un nivel más de anidamiento).
3. `quarto render --to html` dentro de `build/ejercicios`.

Si renderizas los ejercicios a mano, **pásate por el paso 2**; sin él los `> [!info]`
salen como texto entrecomillado y, peor, los desplegables de solución salen sin botón
de plegado.

El paso a PDF hace, en este orden:

1. `quarto render --to pdf` (genera `Economía.tex`).
2. Posprocesado obligatorio: `sed -i 's/\\begin{table}$/\\begin{table}[H]/' Economía.tex`
   — corrige el problema de las tablas descrito en la sección 3.
3. Compila el `.tex` corregido **manualmente** con `lualatex` dos veces (para que se
   resuelvan bien las referencias cruzadas y el índice), en vez de dejar que sea Quarto
   quien compile automáticamente — si lo hace Quarto, se pierde el posprocesado del
   paso 2.

Si añades una tabla o figura nueva y el PDF te sale con algo desplazado de sitio, antes
de nada comprueba que has seguido este pipeline completo y no solo `quarto render --to pdf`
a secas.

## 5. Cómo añadir o mover un tema

1. Crea `tema-NN.qmd` con el *chunk* de configuración estándar (sección 1) y un único `#`.
2. Decide en qué unidad (`part:`) de `_quarto.yml` va, y añade la ruta en el bloque
   `chapters:` correspondiente, en el orden que quieras que aparezca.
3. Si insertas un tema en medio y hay que renumerar archivos existentes, renumera los
   **nombres de archivo** (`tema-04.qmd` → `tema-05.qmd`, etc.) — Quarto numera los
   capítulos por su posición en `_quarto.yml`, no por el nombre del archivo, pero conviene
   mantenerlos alineados para que el repositorio sea legible.
4. Las etiquetas de figuras/tablas (`fig-xxx`, `tbl-xxx`) deben ser **únicas en todo el
   proyecto**, no solo dentro del archivo — Quarto las resuelve a nivel de proyecto. Puedes
   mover contenido de un tema a otro sin romper las referencias cruzadas (`@fig-xxx`,
   `@tbl-xxx`) mientras la etiqueta no cambie.
5. Renderiza (`./render.sh all`) y revisa visualmente las páginas afectadas antes de dar
   el cambio por bueno — muchos de los bugs de este proyecto solo se detectan mirando el
   PDF renderizado, no leyendo el código fuente.

## 6. Ejercicios y apuntes pendientes de completar

Los ejercicios **no se integran en los temas ni en el libro**: viven como proyecto aparte
en `ejercicios/*.md` y se enlazan desde la sección «Ejercicios en HTML» de la landing
(`index.qmd`). Si te pidan añadir ejercicios:

- Pon el archivo en `ejercicios/` con nombre en minúsculas y guiones, y regístralo en el
  `part:` correspondiente de `ejercicios/_quarto.yml` (y en el `sidebar:`).
- Usa sintaxis de GitHub para los avisos (`> [!tip] Título`); el script los traduce
  (sección 3). Cada solución va en su propio desplegable `> [!example]- Solución` bajo
  su enunciado (ver «Cómo es un ejercicio» en la sección 1).
- En la sección «Ejercicios en HTML» de `index.qmd`, sustituye el `placeholder-link` del
  tema correspondiente por los enlaces reales. Si el tema ya tiene ejercicios, se los
  añades; si es el primero, la entrada pasa a ser un encabezado en negrita con el título
  del tema, como las que ya están resueltas.
- Si un ejercicio **no tiene solución**, déjalo sin desplegable. No la inventes.
- El libro de texto es fundamentalmente **teórico**: los ejercicios resueltos son
  ilustraciones puntuales, no una batería de práctica. El cuaderno de ejercicios es el
  sitio natural para el volumen grande, no saturar los temas.

Si lo que te piden es ampliar la **explicación** de un tema, entonces sí: intégralo en
el `tema-NN.qmd` que le corresponda, seleccionando o creando el apartado (`##`/`###`)
adecuado, y sigue las reglas de estilo de la sección 3.

## 7. Git y publicación

- La rama `main` se renderiza y publica automáticamente en GitHub Pages en cada *push*
  (ver `.github/workflows/publish.yml`). No hace falta subir `_book/` a mano ni
  commitear el PDF: son artefactos generados, y están en `.gitignore`.
- Si quieres publicar también el PDF como descarga, súbelo como *release asset* de
  GitHub en vez de comitearlo al repositorio (evita hinchar el historial con binarios).
- Mensajes de commit en español, en imperativo y describiendo el contenido, no el
  proceso: `"Añade el tema de economía del comportamiento"`, no
  `"cambios varios"` ni `"update tema-03.qmd"`.
