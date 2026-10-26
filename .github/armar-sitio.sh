#!/usr/bin/env bash
# Reúne en _site/ solo los archivos públicos del sitio (lista blanca) y lo verifica.
# Lo usa .github/workflows/pages.yml; también se puede ejecutar en local: bash .github/armar-sitio.sh
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf _site
mkdir -p _site/img
cp index.html og-image.jpg sitemap.xml googledf468d263b02a1bc.html _site/
cp img/*.jpg img/*.webp _site/img/

python3 - <<'EOF'
import os, re, sys
errores = []
publicados = sorted(os.path.relpath(os.path.join(r, f), '_site') for r, _, fs in os.walk('_site') for f in fs)

# Nada de desarrollo, revisión ni Firebase admin en el sitio
prohibido = re.compile(r'^(docs|prototipo|firebase|\.github)/|DESIGN\.md$|README\.md$|\.(mjs|rules|json|log)$|placa-consola')
errores += [f'no debe publicarse: {p}' for p in publicados if prohibido.search(p)]

# Toda referencia local de index.html debe existir en _site
html = open('_site/index.html', encoding='utf-8').read()
refs = set(re.findall(r'(?:src|href)="([^"#:]+)"', html)) | {u.split()[0] for s in re.findall(r'srcset="([^"]+)"', html) for u in s.split(',')}
for ref in sorted(refs):
    if not os.path.isfile(os.path.join('_site', ref)):
        errores.append(f'referencia rota en index.html: {ref}')

for p in publicados: print('  ' + p)
if errores:
    print('\n'.join(errores), file=sys.stderr); sys.exit(1)
print(f'Sitio listo: {len(publicados)} archivos, {len(refs)} referencias locales comprobadas.')
EOF
