# WindowsFormTransparency Module

Un módulo de PowerShell que permite controlar la transparencia de formularios Windows Forms mediante atajos de teclado.

## 🚀 Características

- Control de transparencia mediante atajos de teclado
- Fácil integración con cualquier aplicación Windows Forms
- Personalización del nivel de transparencia y paso de incremento
- Soporte para múltiples combinaciones de teclas

## 📋 Requisitos

- Windows PowerShell 5.1 o PowerShell Core 7.x
- Windows 10/11

## 🔧 Instalación

### Opción 1: Instalación Manual
1. Clona este repositorio:
```powershell
git clone https://github.com/TuUsuario/WindowsFormTransparency.git
```

2. Copia el módulo a una de las siguientes ubicaciones:
   - Proyecto específico: Copia `TransparencyModule.psm1` a la carpeta de tu proyecto


   - Instalación global: 
```powershell
Copy-Item "TransparencyModule.psm1" -Destination "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\TransparencyModule"
```

### Opción 2: Desde PowerShell Gallery (Próximamente)
```powershell
Install-Module -Name WindowsFormTransparency
```

## 📖 Uso

1. Importa el módulo en tu script:
```powershell
Import-Module TransparencyModule
```

2. Inicializa la transparencia en tu formulario:
```powershell
$form = New-Object System.Windows.Forms.Form
Initialize-FormTransparency -Form $form -InitialTransparency 1.0 -Step 0.1
```

3. ¡Listo! Ahora puedes usar las siguientes combinaciones de teclas:
   - `Ctrl + Plus`: Aumentar opacidad
   - `Ctrl + Minus`: Disminuir opacidad
   - `Alt + Plus`: Aumentar opacidad
   - `Alt + Minus`: Disminuir opacidad

## 🎯 Ejemplo Completo

```powershell
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Importar el módulo
Import-Module TransparencyModule

# Crear formulario
$form = New-Object System.Windows.Forms.Form
$form.Text = "Demo Transparencia"
$form.Size = New-Object System.Drawing.Size(300, 200)

# Inicializar transparencia
Initialize-FormTransparency -Form $form -InitialTransparency 1.0 -Step 0.1

# Mostrar formulario
[System.Windows.Forms.Application]::Run($form)
```

## 📚 Documentación API

### Initialize-FormTransparency
```powershell
Initialize-FormTransparency -Form [System.Windows.Forms.Form] -InitialTransparency [double] -Step [double]
```
- `Form`: El formulario Windows Forms a controlar
- `InitialTransparency`: Valor inicial de transparencia (1.0 = opaco, 0.1 = casi transparente)
- `Step`: Incremento/decremento por cada pulsación de tecla

### Set-TransparencyStep
```powershell
Set-TransparencyStep -Form [System.Windows.Forms.Form] -Step [double]
```
Cambia el valor del incremento de transparencia

### Get-FormTransparency
```powershell
Get-FormTransparency -Form [System.Windows.Forms.Form]
```
Obtiene el valor actual de transparencia del formulario



## 📝 Licencia

MIT License - ver archivo [LICENSE.MD](LICENSE.MD)




## ✨ Contribuir

1. Haz un Fork del proyecto
2. Crea una rama para tu función (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add: nueva característica'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request
