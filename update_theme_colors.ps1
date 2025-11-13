# Script para actualizar AppColors a ThemeHelper en todos los archivos
$files = Get-ChildItem -Path "lib\features" -Filter "*.dart" -Recurse | Where-Object { 
    (Get-Content $_.FullName -Raw) -match "AppColors\." 
}

foreach ($file in $files) {
    Write-Host "Procesando: $($file.FullName)"
    
    $content = Get-Content $file.FullName -Raw
    
    # Agregar import de ThemeHelper si no existe
    if ($content -notmatch "import.*theme_helper") {
        $content = $content -replace "(import.*app_colors.*\n)", "`$1import '../../../../core/theme/theme_helper.dart';`n"
    }
    
    # Reemplazos de colores comunes
    $replacements = @{
        'AppColors\.primaryBlue' = 'ThemeHelper.primaryBlue(context)'
        'AppColors\.primaryCyan' = 'ThemeHelper.primaryCyan(context)'
        'AppColors\.background' = 'ThemeHelper.background(context)'
        'AppColors\.white' = 'ThemeHelper.white(context)'
        'AppColors\.textPrimary' = 'ThemeHelper.textPrimary(context)'
        'AppColors\.textSecondary' = 'ThemeHelper.textSecondary(context)'
        'AppColors\.textLight' = 'ThemeHelper.textLight(context)'
        'AppColors\.darkNavy' = 'ThemeHelper.darkNavy(context)'
    }
    
    foreach ($key in $replacements.Keys) {
        $content = $content -replace $key, $replacements[$key]
    }
    
    Set-Content -Path $file.FullName -Value $content -NoNewline
}

Write-Host "Actualización completada!"
