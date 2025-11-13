# Settings Feature - Theme Management

Implementación del sistema de temas con soporte para modo claro, oscuro y automático según el sistema.

## Estructura

```
settings/
└── presentation/
    └── pages/
        └── theme_settings_page.dart    # Página de configuración de tema
```

## Arquitectura

### State Management
- **Provider**: Gestión del estado del tema a nivel global
- **ThemeProvider**: ChangeNotifier que maneja el tema actual
- **Hive**: Persistencia local de la preferencia del usuario

### Temas Disponibles
1. **Claro**: Tema con colores claros
2. **Oscuro**: Tema con colores oscuros optimizados
3. **Sistema**: Sigue la configuración del sistema operativo

## Paleta de Colores

### Modo Claro (AppColors)
- Primary Blue: `#1E3A8A`
- Primary Cyan: `#06B6D4`
- Background: `#F8FAFC`
- Text Primary: `#1E3A8A`

### Modo Oscuro (AppColorsDark)
- Primary Blue: `#3B82F6`
- Primary Cyan: `#06B6D4`
- Background: `#0F172A`
- Text Primary: `#F8FAFC`

## Uso

### Acceder al tema actual
```dart
final themeProvider = Provider.of<ThemeProvider>(context);
final currentMode = themeProvider.themeMode;
```

### Cambiar el tema
```dart
themeProvider.setThemeMode(AppThemeMode.dark);
```

### Usar colores adaptativos
```dart
// Opción 1: Helper
Color color = ThemeHelper.primaryBlue(context);

// Opción 2: Directo
final isDark = Theme.of(context).brightness == Brightness.dark;
Color color = isDark ? AppColorsDark.primaryBlue : AppColors.primaryBlue;
```

## Mejores Prácticas Implementadas

1. **Separación de responsabilidades**: Colores, temas y provider en archivos separados
2. **Persistencia**: Las preferencias se guardan en Hive
3. **Reactividad**: Uso de ChangeNotifier para actualización automática
4. **Accesibilidad**: Soporte para preferencias del sistema
5. **Type Safety**: Enum para los modos de tema
6. **Escalabilidad**: Fácil agregar nuevos colores o temas
