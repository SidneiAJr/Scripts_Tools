# Habilitar Visualizador de Fotos clássico no Windows 10/11

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations"

# Se a chave não existir, cria
if (-not (Test-Path $regPath)) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities" -Name "FileAssociations" -Force | Out-Null
}

# Adiciona extensões de imagem comuns
New-ItemProperty -Path $regPath -Name ".jpg" -Value "PhotoViewer.FileAssoc.Tiff" -PropertyType String -Force
New-ItemProperty -Path $regPath -Name ".jpeg" -Value "PhotoViewer.FileAssoc.Tiff" -PropertyType String -Force
New-ItemProperty -Path $regPath -Name ".png" -Value "PhotoViewer.FileAssoc.Tiff" -PropertyType String -Force
New-ItemProperty -Path $regPath -Name ".bmp" -Value "PhotoViewer.FileAssoc.Tiff" -PropertyType String -Force
New-ItemProperty -Path $regPath -Name ".gif" -Value "PhotoViewer.FileAssoc.Tiff" -PropertyType String -Force
New-ItemProperty -Path $regPath -Name ".tiff" -Value "PhotoViewer.FileAssoc.Tiff" -PropertyType String -Force

Write-Host "✅ Visualizador de Fotos clássico habilitado! 
Agora vá em Configurações > Aplicativos padrão e defina o 'Visualizador de Fotos do Windows' como padrão."
