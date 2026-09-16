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
_quarto.yml          # Configuración del proyecto: formatos, unidades (parts), capítulos
index.qmd             # Portada/presentación del libro
tema-01.qmd … tema-14.qmd   # Un archivo por tema, cada uno UN SOLO capítulo (un único "# Título" H1)
render.sh              # Pipeline de renderizado completo (HTML + PDF), ver sección 4
.github/workflows/      # CI: renderiza a HTML y publica en GitHub Pages en cada push a main
```

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
- Fija siempre el *locale* al renderizar: `LANG=C.utf8 LC_ALL=C.utf8` — sin esto, los
  acentos y las letras con tilde se corrompen en el PDF.

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
./render.sh html   # solo la web (rápido, sin LaTeX)
./render.sh pdf    # el libro en PDF (requiere el entorno LaTeX completo)
./render.sh all    # ambos
```

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

Si te piden completar apuntes o ejercicios sueltos que aparecen en la carpeta (fuera de
los `tema-NN.qmd` ya integrados), el criterio es:

- Intégralos dentro del tema que les corresponda temáticamente, seleccionando o creando
  el apartado (`##`/`###`) adecuado — no los dejes como archivos sueltos sin conectar
  con el resto del libro.
- Los ejercicios resueltos siguen el patrón `.callout-tip` con título
  `## Ejercicio resuelto: <qué calcula>`, enunciado en texto normal y solución con las
  fórmulas en LaTeX (`$$...$$` o `$...$`), igual que los ya existentes — cópialos como
  plantilla antes de escribir uno nuevo.
- El libro es fundamentalmente **teórico**: los ejercicios resueltos son ilustraciones
  puntuales dentro de la exposición, no una batería de práctica exhaustiva. Si el volumen
  de ejercicios que hay que añadir es grande, plantea antes si conviene un cuaderno de
  ejercicios aparte en vez de saturar el libro de texto.

## 7. Git y publicación

- La rama `main` se renderiza y publica automáticamente en GitHub Pages en cada *push*
  (ver `.github/workflows/publish.yml`). No hace falta subir `_book/` a mano ni
  commitear el PDF: son artefactos generados, y están en `.gitignore`.
- Si quieres publicar también el PDF como descarga, súbelo como *release asset* de
  GitHub en vez de comitearlo al repositorio (evita hinchar el historial con binarios).
- Mensajes de commit en español, en imperativo y describiendo el contenido, no el
  proceso: `"Añade el tema de economía del comportamiento"`, no
  `"cambios varios"` ni `"update tema-03.qmd"`.
