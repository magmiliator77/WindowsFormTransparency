# Módulo para control de transparencia en formularios Windows Forms
# TransparencyModule.psm1

# Variables del módulo
$script:defaultTransparency = 1.0
$script:defaultStep = 0.1

# Función para inicializar la transparencia en un formulario
function Initialize-FormTransparency {
    param (
        [Parameter(Mandatory = $true)]
        [System.Windows.Forms.Form]$Form,
        [double]$InitialTransparency = $script:defaultTransparency,
        [double]$Step = $script:defaultStep
    )

    # Agregar propiedades personalizadas al formulario
    $Form | Add-Member -NotePropertyName "TransparencyValue" -NotePropertyValue $InitialTransparency -Force
    $Form | Add-Member -NotePropertyName "TransparencyStep" -NotePropertyValue $Step -Force
    
    # Establecer la transparencia inicial
    $Form.Opacity = $InitialTransparency
    
    # Habilitar control de teclas
    $Form.KeyPreview = $true
      # Agregar el manejador de eventos
    $Form.Add_KeyDown({
        param($currentForm, $e)
        
        $increase = $false
        
        # Detectar combinaciones de teclas
        switch ($true) {
            # Ctrl + Plus
            ($e.Control -and $e.KeyCode -eq 'Oemplus') { $increase = $true }
            # Ctrl + Minus
            ($e.Control -and $e.KeyCode -eq 'OemMinus') { $increase = $false }
            # Alt + Plus
            ($e.Alt -and $e.KeyCode -eq 'Oemplus') { $increase = $true }
            # Alt + Minus
            ($e.Alt -and $e.KeyCode -eq 'OemMinus') { $increase = $false }
            # Si no es ninguna combinación válida, salir
            default { return }
        }
        
        # Ajustar transparencia
        if ($increase) {
            $currentForm.TransparencyValue = [Math]::Min(1.0, $currentForm.TransparencyValue + $currentForm.TransparencyStep)
        } else {
            $currentForm.TransparencyValue = [Math]::Max(0.1, $currentForm.TransparencyValue - $currentForm.TransparencyStep)
        }
        
        $currentForm.Opacity = $currentForm.TransparencyValue
    })
}

# Función para cambiar el paso de transparencia
function Set-TransparencyStep {
    param (
        [Parameter(Mandatory = $true)]
        [System.Windows.Forms.Form]$Form,
        [double]$Step = 0.1
    )
    
    if ($Form.TransparencyStep) {
        $Form.TransparencyStep = $Step
    }
}

# Función para obtener el valor actual de transparencia
function Get-FormTransparency {
    param (
        [Parameter(Mandatory = $true)]
        [System.Windows.Forms.Form]$Form
    )
    
    if ($Form.TransparencyValue) {
        return $Form.TransparencyValue
    }
    return $Form.Opacity
}

# Exportar las funciones que queremos hacer públicas
Export-ModuleMember -Function Initialize-FormTransparency, Set-TransparencyStep, Get-FormTransparency
