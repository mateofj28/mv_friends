# Referral Detail Feature

## Estructura

```
referral_detail/
├── data/
│   ├── datasources/        # API services, local storage
│   └── repositories/       # Repository implementations
├── domain/
│   ├── models/            # Data models
│   └── repositories/      # Repository interfaces
└── presentation/
    ├── pages/             # Main page (referral_detail_page.dart)
    └── widgets/           # UI components
```

## Descripción

Feature para mostrar el detalle completo de un referido, incluyendo:
- Información del referido
- Estado actual
- Historial de cambios
- Acciones disponibles

## Arquitectura

Sigue Clean Architecture:
- **Presentation**: UI y widgets
- **Domain**: Lógica de negocio y modelos
- **Data**: Fuentes de datos y repositorios
