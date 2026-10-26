# TECNODOLPHY — Sistema de diseño «Corte térmico»
> Un taller que baja temperaturas. El calor violeta se enfría hacia el azul hielo, y cada pieza lleva la esquina biselada de un chip.

**Tema:** oscuro · **Estado:** v1 propuesta (rama `rediseno-corte-termico`) · **Stack:** HTML/CSS/JS sin dependencias, GitHub Pages, Firebase compat (sin cambios)

TECNODOLPHY es un taller de soporte técnico de PCs y laptops en Cochabamba. La identidad nace del oficio: limpiar, cambiar pasta térmica y devolver un equipo **más frío y más rápido**. Por eso el único degradado del sistema no es decoración, es una **escala térmica**: violeta caliente (`#B14CFF`) → azul frío (`#4CC9FF`). Aparece solo donde cuenta esa historia: la barra térmica del hero, el recorrido de «Cómo trabajamos» y el borde del plan destacado.

La forma propia es el **encapsulado de un chip**: un rectángulo con la esquina superior derecha biselada. Se repite en fotos, tarjetas, botones y logo. De la dirección A tomamos la **presentación de datos técnicos** (fichas de estado, listas de verificación, cifras tabulares) y de la C, la **limpieza**: un solo tono de acción, superficies separadas por tono y no por líneas, mucho aire.

Todo lo anterior basado en Discord (`--blurple`, `--greyple`, `ABC Ginto`, el mock de chat) queda **retirado**.

## Tokens — Colores

| Nombre | Valor | Token | Rol |
|---|---|---|---|
| Núcleo | `#0D0A1F` | `--bg` | Fondo de página. Negro violáceo, nunca negro puro |
| Placa | `#17122E` | `--surface-1` | Tarjetas, paneles, header al hacer scroll |
| Placa alta | `#221B42` | `--surface-2` | Elementos sobre una tarjeta: pestaña inactiva, chips de estado, campos |
| Placa activa | `#2D2456` | `--surface-3` | Hover de superficies y foco de campos |
| Tinta | `#F1EEFF` | `--ink` | Títulos y texto corrido (17:1 sobre Núcleo) |
| Tinta media | `#B9B2D9` | `--ink-2` | Texto secundario y descripciones (9,7:1) |
| Tinta baja | `#8F87B5` | `--ink-3` | Metadatos y notas pequeñas (≥5,4:1) |
| Acción | `#7B3FF2` | `--action` | **Único color de botón principal** (WhatsApp). Texto blanco 5,5:1 |
| Acción pulsada | `#6D35E0` | `--action-press` | Hover/pressed de Acción (6,5:1) |
| Calor | `#B14CFF` | `--heat` | Inicio de la escala térmica. **No usar como color de texto pequeño** (4,1:1 sobre Placa alta) |
| Calor legible | `#D9A6FF` | `--heat-ink` | Texto de etiquetas «destacado» como «Ahorras 20 Bs» (8,3:1 sobre Placa alta) |
| Frío | `#4CC9FF` | `--cool` | Final de la escala térmica, checks de listas, lecturas de datos |
| Estado OK | `#5BE3A0` | `--ok` | Solo «Listo / Verificado». Nunca decorativo |
| Error | `#FF6B9A` | `--danger` | Alertas de formulario |

**Escala térmica** (`--thermal`): `linear-gradient(90deg, #B14CFF 0%, #8A6BFF 45%, #4CC9FF 100%)`. Ningún otro degradado está permitido.

**Luz** (`--glow-heat`): `radial-gradient(closest-side, rgba(177,76,255,.22), transparent)`. Un único halo detrás de la foto del hero; nada más brilla.

**Proporciones:** 80 % Núcleo y Placa, 12 % Tinta, 5 % Acción, 3 % escala térmica y Frío.

## Tokens — Tipografía

### Sora — familia única · `--font`
- **Fuente:** Google Fonts, `Sora:wght@400;600;700`, `display=swap`
- **Pesos:** 400 texto, 600 UI y subtítulos, 700 titulares y precios
- **Cifras:** `font-variant-numeric: tabular-nums` en precios, horarios y fichas técnicas
- **Respaldo:** `ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, sans-serif`

| Rol | Tamaño | Peso | Interlineado | Tracking | Token |
|---|---|---|---|---|---|
| Display (h1 del hero) | `clamp(2.6rem, 6.4vw, 5.25rem)` | 700 | 0.98 | -0.035em | `--t-display` |
| Título de sección (h2) | `clamp(2rem, 4.2vw, 3.25rem)` | 700 | 1.02 | -0.03em | `--t-h2` |
| Precio | `clamp(3rem, 5vw, 4rem)` | 700 | 0.9 | -0.04em | `--t-price` |
| Título de tarjeta (h3) | `1.25rem` | 600 | 1.25 | -0.01em | `--t-h3` |
| Entradilla | `clamp(1.0625rem, 1.4vw, 1.25rem)` | 400 | 1.55 | 0 | `--t-lead` |
| Texto | `1rem` | 400 | 1.6 | 0 | `--t-body` |
| Nota | `0.875rem` | 400/600 | 1.45 | 0 | `--t-small` |

Titulares en **mayúsculas y minúsculas normales**, no en versalitas (se abandona el `uppercase` heredado). Máximo dos líneas por titular en cualquier ancho.

## Tokens — Espaciado y retícula

Base 4 px. Escala: `4 · 8 · 12 · 16 · 24 · 32 · 48 · 64 · 96 · 128` (`--s-1` … `--s-10`).

| Token | Valor |
|---|---|
| `--wrap` | `min(1200px, 100% - 2 × --gutter)` |
| `--gutter` | `16px` (<600) · `24px` (600–1000) · `32px` (>1000) |
| `--section` | `clamp(72px, 10vw, 144px)` entre secciones |
| `--card-pad` | `clamp(24px, 3vw, 32px)` |

## Forma — el bisel

| Token | Valor | Uso |
|---|---|---|
| `--cut-sm` | `10px` | Botones, chips |
| `--cut-md` | `18px` | Tarjetas de precio, pasos, reseñas |
| `--cut-lg` | `40px` | Foto del hero, bloque de «Nosotros» |
| `--radius` | `6px` | Esquinas no biseladas (las otras tres) |

```css
.chip-shape{clip-path:polygon(0 0,calc(100% - var(--cut)) 0,100% var(--cut),100% 100%,0 100%,0 0)}
```

El bisel se aplica con `clip-path` sobre un **pseudo-elemento de fondo** (`::before`), nunca sobre el elemento enfocable, para que el anillo de foco no quede recortado.

## Profundidad

- Las superficies se separan **por tono** (Núcleo → Placa → Placa alta), no por bordes ni sombras.
- Sombra solo en lo que flota: modales, desplegable de usuario y botón flotante de WhatsApp: `0 20px 48px -12px rgba(5,3,15,.7)`.
- El plan destacado se distingue con un **filo térmico** de 3 px en su borde superior (la escala térmica), no con un fondo de color.

## Movimiento

| Token | Valor | Uso |
|---|---|---|
| `--ease-out` | `cubic-bezier(.23,1,.32,1)` | Entradas, aparición de tarjetas |
| `--ease-in-out` | `cubic-bezier(.77,0,.175,1)` | Indicador de pestañas |
| `--d-press` | `160ms` | `:active` → `scale(.97)` |
| `--d-ui` | `220ms` | Pestañas, desplegables, modales |
| `--d-enter` | `520ms` | Entrada de elementos al hacer scroll |
| `--stagger` | `70ms` | Entre tarjetas hermanas |

Reglas:
1. Solo se animan `transform` y `opacity`. El enfriamiento de la barra térmica se hace con `transform: scaleX()` sobre una capa.
2. Hover solo dentro de `@media (hover:hover) and (pointer:fine)`.
3. Las entradas al hacer scroll se disparan **una vez** (IntersectionObserver) y el contenido es visible si el JS no carga (la clase `.js` en `<html>` activa el estado inicial).
4. `prefers-reduced-motion: reduce`: sin desplazamientos, se conservan los fundidos de opacidad de 150 ms.
5. Nada da vueltas ni rebota de forma continua. Se retiran los elementos `bob` del hero actual.

## Componentes

### Botón principal (WhatsApp)
Fondo `--action`, texto blanco 600 16 px, icono de WhatsApp de 20 px, alto mínimo 52 px, bisel `--cut-sm`. Texto siempre explícito: **«Agendar por WhatsApp»** (o «Agendar [servicio]» en las tarjetas). `:active` → `scale(.97)`. Es la **única** acción con relleno de color en cada pantalla.

### Botón secundario
Fondo `--surface-2`, texto `--ink`, mismo alto y bisel. Para «Ver precios» y «Llamar».

### Botón terciario (Iniciar sesión)
Texto `--ink-2` sin fondo, con icono de usuario. En el header nunca compite con WhatsApp; en <600 px pasa a icono de 44×44 con `aria-label`.

### Pestañas segmentadas (Estándar / Gamer)
Contenedor `--surface-1`, indicador `--surface-3` que se desliza con `transform: translateX()` (220 ms, `--ease-in-out`). `role="tablist"`, *roving tabindex*, flechas, Inicio y Fin. Los enlaces del footer «Equipo gamer» y «Equipo estándar» activan su pestaña.

### Tarjeta de precio
Fondo `--surface-1` con bisel `--cut-md`. Orden: nombre (h3) → descripción (`--ink-2`) → **precio** (`--t-price`, tabular) + «Bs» → lista de lo que incluye con checks `--cool` → botón WhatsApp al pie. Plan destacado (Combo): filo térmico superior, etiqueta «Ahorras 20 Bs» en `--heat-ink` sobre `--surface-2` y botón principal; los demás llevan botón secundario con icono de WhatsApp.

### Ficha de servicio (de la dirección A)
Panel `--surface-1` con lista de verificación: estado en `--ok`, texto en `--ink`, y la **barra térmica** (Calor → Frío) con las etiquetas «Antes» y «Después». **Sin cifras inventadas:** solo pasos reales de los servicios publicados.

### Header
Barra de 68 px, `--bg` con 85 % de opacidad y `backdrop-filter: blur(12px)` (única transparencia del sistema). Marca a la izquierda, 5–6 enlaces, Iniciar sesión (terciario) y **Agendar** (principal compacto) a la derecha. En <1000 px: marca, icono de usuario y menú.

## Imágenes

- Solo **fotos reales del taller** aprobadas por el dueño. Nada de bancos de imágenes ni fotos personales.
- Formato JPEG/WebP en `img/`, con ancho y alto declarados para evitar saltos de diseño, `loading="lazy"` salvo en el hero.
- Tratamiento único: recorte con bisel `--cut-lg`, un velo `linear-gradient(180deg, transparent 55%, rgba(13,10,31,.65))` solo cuando hay texto encima.
- Retirar las fotos rotas en tiempo de ejecución (`hideShot`) solo como red de seguridad: las imágenes deben existir en el repositorio.

## Accesibilidad

- Contraste AA mínimo; el texto corrido siempre en `--ink` o `--ink-2`.
- Foco: `outline: 2px solid var(--cool); outline-offset: 3px`.
- Objetivos táctiles ≥ 44×44 px.
- Enlace «Saltar al contenido», un único `h1`, `h2` por sección.
- Modales: foco atrapado, Esc, devolución del foco y bloqueo del scroll de fondo.

## Responsive

| Ancho | Composición |
|---|---|
| 375 | Una columna. Hero: titular → entradilla → botón WhatsApp a todo el ancho → foto 4:3 con la ficha debajo. Precios: pestañas a todo el ancho y tarjetas apiladas con la lista recortada a 4 elementos + «ver todo» |
| 768 | Hero en una columna con la foto más grande; precios en 1 columna con máximo 560 px |
| 1440 | Hero 6/6; precios en 3 columnas |
| 1920 | Igual que 1440, contenedor máximo de 1200 px; el halo del hero crece |

## Qué no hacer

- No volver a la paleta de Discord ni a nombres de tokens de otras marcas.
- No usar degradados que no sean la escala térmica.
- No poner más de una acción con relleno de color por pantalla.
- No inventar métricas (temperaturas, porcentajes, clientes).
- No cambiar precios, textos comerciales, Firebase ni el comportamiento de reseñas y perfiles sin autorización.
