# Estado de Migracion del Sistema de Temas

## Archivos Actualizados

1. `lib/features/home/presentation/widgets/home_header.dart`
2. `lib/features/home/presentation/pages/home_page.dart`
3. `lib/features/profile/presentation/widgets/profile_header.dart`
4. `lib/features/profile/presentation/widgets/profile_title.dart`
5. `lib/features/home/presentation/widgets/user_profile_card.dart`
6. `lib/features/rewards/presentation/pages/rewards_page.dart`
7. `lib/features/referral/presentation/pages/referral_page.dart`
8. `lib/features/rewards_redeem/presentation/pages/rewards_redeem_page.dart`
9. `lib/features/coupon_generation/presentation/pages/coupon_generation_page.dart`
10. `lib/features/coupon_generation/presentation/widgets/coupon_display.dart`

## Archivos Pendientes (40 restantes)

### Home
- [ ] `lib/features/home/presentation/widgets/bottom_nav_bar.dart`
- [ ] `lib/features/home/presentation/widgets/floating_chat_button.dart`
- [ ] `lib/features/home/presentation/widgets/menu_card.dart`
- [ ] `lib/features/home/presentation/widgets/tier_badge.dart`

### Notifications
- [ ] `lib/features/notifications/presentation/widgets/empty_notifications.dart`
- [ ] `lib/features/notifications/presentation/widgets/notifications_header.dart`
- [ ] `lib/features/notifications/presentation/widgets/notification_card.dart`

### Profile
- [ ] `lib/features/profile/presentation/pages/profile_page.dart`
- [ ] `lib/features/profile/presentation/pages/terms_conditions_page.dart`
- [ ] `lib/features/profile/presentation/widgets/profile_menu_item.dart`
- [ ] `lib/features/profile/presentation/widgets/profile_stats_card.dart`
- [ ] `lib/features/profile/presentation/widgets/section_title.dart`

### Referral
- [ ] `lib/features/referral/presentation/widgets/referral_dropdown.dart`
- [ ] `lib/features/referral/presentation/widgets/referral_header.dart`
- [ ] `lib/features/referral/presentation/widgets/referral_question.dart`
- [ ] `lib/features/referral/presentation/widgets/referral_text_field.dart`
- [ ] `lib/features/referral/presentation/widgets/submit_button.dart`

### Referral Detail
- [ ] `lib/features/referral_detail/presentation/pages/referral_detail_page.dart`
- [ ] `lib/features/referral_detail/presentation/widgets/referral_detail_header.dart`
- [ ] `lib/features/referral_detail/presentation/widgets/referral_user_header.dart`
- [ ] `lib/features/referral_detail/presentation/widgets/status_timeline.dart`

### Referral Status
- [ ] `lib/features/referral_status/presentation/pages/referral_status_page.dart`
- [ ] `lib/features/referral_status/presentation/widgets/filter_chips.dart`
- [ ] `lib/features/referral_status/presentation/widgets/referral_status_card.dart`
- [ ] `lib/features/referral_status/presentation/widgets/referral_status_header.dart`

### Rewards
- [ ] `lib/features/rewards/presentation/widgets/redeem_button.dart`
- [ ] `lib/features/rewards/presentation/widgets/rewards_header.dart`
- [ ] `lib/features/rewards/presentation/widgets/tier_requirements.dart`
- [ ] `lib/features/rewards/presentation/widgets/transaction_history.dart`
- [ ] `lib/features/rewards/presentation/widgets/wallet_balance.dart`

### Rewards Plan
- [ ] `lib/features/rewards_plan/presentation/pages/city_rewards_page.dart`
- [ ] `lib/features/rewards_plan/presentation/pages/rewards_plan_page.dart`
- [ ] `lib/features/rewards_plan/presentation/widgets/filter_section.dart`
- [ ] `lib/features/rewards_plan/presentation/widgets/rewards_plan_header.dart`
- [ ] `lib/features/rewards_plan/presentation/widgets/reward_card.dart`
- [ ] `lib/features/rewards_plan/presentation/widgets/tier_tabs.dart`

### Rewards Redeem
- [ ] `lib/features/rewards_redeem/presentation/pages/rewards_redeem_page.dart`

### Welcome
- [ ] `lib/features/welcome/presentation/widgets/custom_text_field.dart`
- [ ] `lib/features/welcome/presentation/widgets/primary_button.dart`
- [ ] `lib/features/welcome/presentation/widgets/welcome_logo.dart`

## Patron de Migracion (ACTUALIZADO - Extensions)

Para cada archivo, seguir estos pasos:

1. **Agregar import de extensions:**
```dart
import '../../../../core/theme/theme_extensions.dart';
```

2. **Reemplazar referencias de AppColors:**
```dart
// Antes
AppColors.primaryBlue

// Ahora (MEJOR PRÁCTICA)
context.primaryBlue
```

3. **Colores que cambian con el tema:**
- `AppColors.primaryBlue` -> `context.primaryBlue`
- `AppColors.primaryCyan` -> `context.primaryCyan`
- `AppColors.background` -> `context.background`
- `AppColors.white` -> `context.surface` (Cambio semantico)
- `AppColors.textPrimary` -> `context.textPrimary`
- `AppColors.textSecondary` -> `context.textSecondary`
- `AppColors.textLight` -> `context.textLight`
- `AppColors.darkNavy` -> `context.darkNavy`

4. **Colores que NO cambian (accent colors):**
- `AppColors.gold` -> `context.gold` (o mantener AppColors.gold)
- `AppColors.silver` -> `context.silver`
- `AppColors.bronze` -> `context.bronze`
- `AppColors.orange` -> `context.orange`

5. **Bonus - Usar ColorScheme cuando sea posible:**
```dart
// Aún mejor para widgets de Material
color: context.colors.primary  // En lugar de context.primaryBlue
```

## Notas

- Los widgets que usan `const` necesitarán remover el `const` si usan colores dinámicos
- Algunos iconos necesitarán cambiar de `const Icon()` a `Icon()` para usar colores dinámicos
- Los colores hardcodeados (como en menu_card.dart) pueden mantenerse o también migrar según preferencia

## MIGRACION A EXTENSIONS COMPLETADA

**Arquitectura actualizada a mejores practicas:**
- Extension methods implementados
- ColorScheme de Flutter integrado
- Codigo mas limpio y conciso

## Progreso Total

**10 de 50 archivos completados (20%)**

## Archivos Criticos Completados (Con Extensions)

Home (header, page, user card) - **Migrado a extensions**
Profile (header, title) - **Migrado a extensions**
Rewards (page, redeem page) - **Migrado a extensions**
Referral (page) - **Migrado a extensions**
Coupon Generation (page, display) - **Migrado a extensions**
Notifications (page) - Ya estaba actualizado

**Nuevo patron:**
```dart
// Antes: ThemeHelper.primaryBlue(context)
// Ahora: context.primaryBlue
```

Las pantallas principales de la app ya usan la mejor practica con extensions.
