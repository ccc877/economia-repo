#!/usr/bin/env bash
#
# Pipeline de renderizado del libro de Economía.
#
# Uso:
#   ./render.sh html   -> solo la versión web (rápido, no necesita LaTeX)
#   ./render.sh pdf    -> solo el PDF (necesita LaTeX completo, ver AGENTS.md §2)
#   ./render.sh all    -> ambos (por defecto si no se pasa argumento)
#
# El paso a PDF incluye un posprocesado obligatorio sobre el .tex generado
# para corregir un problema real de kableExtra + Quarto con la posición de
# las tablas. Ver AGENTS.md §3 y §4 para el porqué. No lo elimines.

set -euo pipefail
cd "$(dirname "$0")"

export LANG=C.utf8
export LC_ALL=C.utf8

MODE="${1:-all}"

render_html () {
  echo "==> Renderizando HTML..."
  rm -rf _book
  quarto render --to html
  echo "==> HTML listo en _book/"
}

render_pdf () {
  echo "==> Renderizando PDF..."
  rm -rf .quarto/_freeze Economía.tex Economía.pdf *.aux *.log *.toc *.out

  quarto render --to pdf

  if [ ! -f Economía.tex ]; then
    echo "ERROR: Quarto no generó Economía.tex (¿falta keep-tex: true en _quarto.yml?)."
    exit 1
  fi

  echo "==> Forzando posición [H] en todas las tablas (workaround kableExtra+Quarto)..."
  sed -i 's/\\begin{table}$/\\begin{table}[H]/' Economía.tex
  n_tablas=$(grep -c '\\begin{table}\[H\]' Economía.tex || true)
  echo "    $n_tablas tablas corregidas."

  echo "==> Compilando con lualatex (dos pasadas, para resolver referencias e índice)..."
  lualatex -interaction=nonstopmode Economía.tex > /tmp/lualatex-pass1.log 2>&1 || {
    echo "ERROR en la primera pasada de lualatex. Revisa /tmp/lualatex-pass1.log"; exit 1;
  }
  lualatex -interaction=nonstopmode Economía.tex > /tmp/lualatex-pass2.log 2>&1 || {
    echo "ERROR en la segunda pasada de lualatex. Revisa /tmp/lualatex-pass2.log"; exit 1;
  }

  mkdir -p _book
  cp Economía.pdf _book/Economía.pdf
  echo "==> PDF listo: Economía.pdf (copia también en _book/)"
}

case "$MODE" in
  html) render_html ;;
  pdf)  render_pdf ;;
  all)  render_html; render_pdf ;;
  *)
    echo "Uso: $0 [html|pdf|all]"
    exit 1
    ;;
esac
