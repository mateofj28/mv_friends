from PIL import Image, ImageDraw
import math

# Crear imagen de 1024x1024 (tamaño recomendado para íconos)
size = 1024
img = Image.new('RGB', (size, size), color='white')
draw = ImageDraw.Draw(img)

# Crear gradiente de fondo
for y in range(size):
    for x in range(size):
        # Calcular el gradiente diagonal
        ratio = (x + y) / (2 * size)
        
        # Colores del gradiente (azul oscuro -> cyan -> cyan claro)
        r1, g1, b1 = 30, 58, 138  # #1E3A8A
        r2, g2, b2 = 6, 182, 212   # #06B6D4
        r3, g3, b3 = 34, 211, 238  # #22D3EE
        
        if ratio < 0.5:
            # Primera mitad del gradiente
            t = ratio * 2
            r = int(r1 + (r2 - r1) * t)
            g = int(g1 + (g2 - g1) * t)
            b = int(b1 + (b2 - b1) * t)
        else:
            # Segunda mitad del gradiente
            t = (ratio - 0.5) * 2
            r = int(r2 + (r3 - r2) * t)
            g = int(g2 + (g3 - g2) * t)
            b = int(b2 + (b3 - b2) * t)
        
        img.putpixel((x, y), (r, g, b))

# Crear una nueva capa para dibujar la casa en blanco
overlay = Image.new('RGBA', (size, size), (0, 0, 0, 0))
draw_overlay = ImageDraw.Draw(overlay)

# Escala y posición
center_x = size // 2
center_y = size // 2
scale = size // 1.8

# Dibujar el techo (triángulo)
roof_points = [
    (center_x, center_y - scale * 0.45),  # Punta superior
    (center_x - scale * 0.45, center_y - scale * 0.12),  # Izquierda
    (center_x + scale * 0.45, center_y - scale * 0.12),  # Derecha
]
draw_overlay.polygon(roof_points, fill='white')

# Dibujar chimenea
chimney_left = center_x + scale * 0.22
chimney_top = center_y - scale * 0.35
chimney_width = scale * 0.1
chimney_height = scale * 0.15
draw_overlay.rectangle(
    [chimney_left, chimney_top, chimney_left + chimney_width, chimney_top + chimney_height],
    fill='white'
)

# Dibujar el cuerpo de la casa (rectángulo redondeado)
house_left = center_x - scale * 0.4
house_top = center_y - scale * 0.12
house_right = center_x + scale * 0.4
house_bottom = center_y + scale * 0.45
draw_overlay.rounded_rectangle(
    [house_left, house_top, house_right, house_bottom],
    radius=20,
    fill='white'
)

# Dibujar ventanas (ojos) - círculos con transparencia
eye_y = center_y + scale * 0.05
eye_radius = scale * 0.08
# Ojo izquierdo
draw_overlay.ellipse(
    [center_x - scale * 0.18 - eye_radius, eye_y - eye_radius,
     center_x - scale * 0.18 + eye_radius, eye_y + eye_radius],
    fill=(30, 58, 138, 100)  # Azul semi-transparente
)
# Ojo derecho
draw_overlay.ellipse(
    [center_x + scale * 0.18 - eye_radius, eye_y - eye_radius,
     center_x + scale * 0.18 + eye_radius, eye_y + eye_radius],
    fill=(30, 58, 138, 100)
)

# Dibujar sonrisa (arco)
smile_y = center_y + scale * 0.22
smile_width = scale * 0.4
smile_height = scale * 0.15
draw_overlay.arc(
    [center_x - smile_width, smile_y - smile_height,
     center_x + smile_width, smile_y + smile_height],
    start=0, end=180,
    fill=(30, 58, 138, 100), width=int(scale * 0.035)
)

# Dibujar puerta (rectángulo redondeado)
door_width = scale * 0.2
door_height = scale * 0.28
door_left = center_x - door_width / 2
door_top = house_bottom - door_height
draw_overlay.rounded_rectangle(
    [door_left, door_top, door_left + door_width, door_top + door_height],
    radius=int(door_width / 2),
    fill=(30, 58, 138, 100)
)

# Combinar las capas
img = img.convert('RGBA')
img = Image.alpha_composite(img, overlay)
img = img.convert('RGB')

# Guardar la imagen
img.save('assets/images/app_icon.png', 'PNG', quality=100)
print("✓ Ícono creado exitosamente: assets/images/app_icon.png")
