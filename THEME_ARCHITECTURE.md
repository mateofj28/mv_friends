# Arquitectura del Sistema de Temas

## Mejores Practicas Implementadas

### 1. Extension Methods (Limpio y Conciso)

En lugar de:
```dart
color: ThemeHelper.primaryBlue(context)  // Verboso
```

Ahora usamos:
```dart
color: context.primaryBlue  // Limpio y elegante
```

### 2. ColorScheme de Flutter (Estandar)

Integramos nuestros colores con el sistema de temas de Flutter:

```dart
// Acceso directo al ColorScheme
final colors = context.colors;  // Theme.of(context).colorScheme

// Colores semánticos de Material Design
color: colors.primary
color: colors.surface
color: colors.onSurface
```

## Estructura de Archivos

```
lib/core/theme/
├── app_colors.dart              # Colores modo claro
├── app_colors_dark.dart         # Colores modo oscuro
├── app_theme.dart               # Definición de ThemeData con ColorScheme
├── theme_extensions.dart        # Extensions para acceso limpio
├── theme_provider.dart          # State management del tema
└── theme_helper.dart            # DEPRECATED - Usar extensions
```

## Uso de Extensions

### Colores Basicos

```dart
// Colores principales
context.primaryBlue
context.primaryCyan
context.background
context.surface  // Antes era "white"
context.darkNavy

// Colores de texto
context.textPrimary
context.textSecondary
context.textLight

// Colores de acento (no cambian con tema)
context.gold
context.silver
context.bronze
context.orange
```

### Verificar Tema Actual

```dart
if (context.isDarkMode) {
  // Lógica específica para modo oscuro
}
```

### Acceso a ColorScheme

```dart
// Acceso completo al ColorScheme de Flutter
final colors = context.colors;

Container(
  color: colors.surface,
  child: Text(
    'Hola',
    style: TextStyle(color: colors.onSurface),
  ),
)
```

### Acceso a TextTheme

```dart
Text(
  'Título',
  style: context.textTheme.headlineLarge,
)
```

## ColorScheme Mapping

Nuestros colores están mapeados al ColorScheme de Flutter:

| Nuestro Color | ColorScheme | Uso |
|--------------|-------------|-----|
| primaryBlue | primary | Botones, acciones principales |
| primaryCyan | secondary | Acciones secundarias |
| background | background | Fondo de la app |
| white/surface | surface | Tarjetas, contenedores |
| darkNavy | onSurface | Texto sobre superficies |
| textSecondary | onSurfaceVariant | Texto secundario |

## Migracion de Codigo Existente

### Antes (ThemeHelper)
```dart
import '../../../../core/theme/theme_helper.dart';

Container(
  color: ThemeHelper.white(context),
  child: Text(
    'Hola',
    style: TextStyle(
      color: ThemeHelper.primaryBlue(context),
    ),
  ),
)
```

### Despues (Extensions)
```dart
import '../../../../core/theme/theme_extensions.dart';

Container(
  color: context.surface,
  child: Text(
    'Hola',
    style: TextStyle(
      color: context.primaryBlue,
    ),
  ),
)
```

## Ventajas de Esta Arquitectura

1. **Codigo mas limpio**: `context.primaryBlue` vs `ThemeHelper.primaryBlue(context)`
2. **Menos imports**: Solo un import de extensions
3. **Type-safe**: Errores en compile-time, no runtime
4. **Estandar de Flutter**: Usa ColorScheme nativo
5. **Facil de extender**: Agregar nuevos colores es simple
6. **Mejor autocompletado**: El IDE sugiere todos los colores disponibles

## Proximos Pasos

1. Extensions creadas
2. ColorScheme configurado
3. Archivos principales migrados (10/50)
4. Migrar archivos restantes (40/50)
5. Deprecar theme_helper.dart
6. Agregar tests para temas

## Convenciones

- Usar `context.surface` en lugar de `context.white` para superficies
- Usar `context.background` para fondos de pantalla
- Usar `context.colors.primary` cuando necesites el color del ColorScheme
- Los colores de acento (gold, silver, etc.) no cambian con el tema

## Recursos

- [Material Design 3 Color System](https://m3.material.io/styles/color/the-color-system/key-colors-tones)
- [Flutter ColorScheme](https://api.flutter.dev/flutter/material/ColorScheme-class.html)
- [Extension Methods en Dart](https://dart.dev/guides/language/extension-methods)
