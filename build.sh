#!/usr/bin/env bash
# Genera las páginas completas a partir de app/cuestionarios-tdah.html (el archivo que se edita).
#   index.html               -> la que sirve Vercel en la raíz del sitio
#   Cuestionarios TDAH.html  -> para abrir con doble clic en la compu
# Uso: bash build.sh
set -euo pipefail
cd "$(dirname "$0")"

ICON="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 26 26'%3E%3Crect x='2' y='15' width='3' height='7' rx='1' fill='%238a8f98'/%3E%3Crect x='7' y='12' width='3' height='10' rx='1' fill='%238a8f98'/%3E%3Crect x='12' y='9' width='3' height='13' rx='1' fill='%238a8f98'/%3E%3Crect x='17' y='6' width='3' height='16' rx='1' fill='%231d5fbf'/%3E%3Crect x='22' y='3' width='2.5' height='19' rx='1' fill='%238a8f98'/%3E%3C/svg%3E"

page() {
  printf '<!doctype html>\n<html lang="es"><head><meta charset="utf-8">'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover,interactive-widget=resizes-content">'
  printf '<meta name="theme-color" media="(prefers-color-scheme: light)" content="#ffffff">'
  printf '<meta name="theme-color" media="(prefers-color-scheme: dark)" content="#141415">'
  printf '<meta name="color-scheme" content="light dark">'
  printf '<link rel="icon" href="%s"></head><body>\n' "$ICON"
  cat app/cuestionarios-tdah.html
  printf '\n</body></html>\n'
}

page > index.html
cp index.html "Cuestionarios TDAH.html"
echo "Listo: index.html y Cuestionarios TDAH.html"
