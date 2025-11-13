import re

# Archivos a actualizar
files = [
    "lib/features/rewards_redeem/presentation/pages/rewards_redeem_page.dart",
    "lib/features/coupon_generation/presentation/pages/coupon_generation_page.dart",
    "lib/features/coupon_generation/presentation/widgets/coupon_display.dart",
]

# Patrón para reemplazar ThemeHelper.method(context) por context.method
pattern = r'ThemeHelper\.(\w+)\(context\)'
replacement = r'context.\1'

for file_path in files:
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Reemplazar el patrón
        updated_content = re.sub(pattern, replacement, content)
        
        # Reemplazar import
        updated_content = updated_content.replace(
            "import '../../../../core/theme/theme_helper.dart';",
            "import '../../../../core/theme/theme_extensions.dart';"
        )
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(updated_content)
        
        print(f"✅ Actualizado: {file_path}")
    except Exception as e:
        print(f"❌ Error en {file_path}: {e}")

print("\n✨ Migración completada!")
