# Economía — 1.º de Bachillerato

Apuntes de Economía de 1.º de Bachillerato, organizados como un proyecto
[Quarto](https://quarto.org) *book*: un archivo por tema, agrupados en 6 unidades
didácticas, que se compilan tanto a una versión web como a un PDF descargable.

## Estructura

- `_quarto.yml` — configuración del libro (formatos, unidades, orden de los temas).
- `index.qmd` — portada.
- `tema-01.qmd` … `tema-14.qmd` — un archivo por tema.
- `render.sh` — script de renderizado (ver más abajo).
- `.github/workflows/publish.yml` — publica la versión web en GitHub Pages en cada
  cambio en `main`.

Para el detalle completo de convenciones de estilo, estructura y el pipeline de
renderizado (incluidos un par de *workarounds* necesarios para que las tablas y los
gráficos salgan bien en PDF), consulta [`AGENTS.md`](./AGENTS.md).

## Renderizar en local

```bash
./render.sh html   # solo la web
./render.sh pdf    # solo el PDF (necesita una instalación de LaTeX)
./render.sh all    # ambos
```

## Publicación

La rama `main` se renderiza y publica automáticamente como página web mediante GitHub
Actions. Para activarlo la primera vez, entra en **Settings → Pages** del repositorio en
GitHub y selecciona la rama `gh-pages` como origen (la crea automáticamente el primer
*workflow* que se ejecute).
