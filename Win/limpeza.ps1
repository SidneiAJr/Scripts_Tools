# =========================================================
#  Debloat Hardcore Windows 10/11
#  Mantém Spooler de Impressão (para quem usa impressora)
# =========================================================

$ErrorActionPreference = "Continue"

# 1) Desativar serviços desnecessários (exceto Spooler)
$servicesToDisable = @(
  "DiagTrack",            # Telemetria
  "dmwappushservice",     # Telemetria push
  "WMPNetworkSvc",        # Compartilhamento WMP
  "XblAuthManager","XblGameSave","XboxGipSvc","XboxNetApiSvc", # Xbox
  "OneSyncSvc","DoSvc",   # OneDrive Sync / Delivery Optimization
  "WerSvc",               # Windows Error Reporting
  "Fax",                  # Fax
  "WSearch"               # Indexação (se não usa pesquisa rápida)
)
foreach ($s in $servicesToDisable) {
  try {
    Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
    Set-Service  -Name $s -StartupType Disabled -ErrorAction SilentlyContinue
    Write-Host "   Serviço desativado: $s"
  } catch { Write-Host "   Falha ao desativar: $s" }
}

# 2) Remover OneDrive
taskkill /F /IM OneDrive.exe 2>$null | Out-Null
$odExe = "$env:SystemRoot\System32\OneDriveSetup.exe"
if (Test-Path "$env:SystemRoot\SysWOW64\OneDriveSetup.exe") { $odExe = "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" }
if (Test-Path $odExe) { & $odExe /uninstall }
Start-Sleep 2
Remove-Item -Recurse -Force "$env:UserProfile\OneDrive" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:LocalAppData\Microsoft\OneDrive" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:ProgramData\Microsoft OneDrive" -ErrorAction SilentlyContinue
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v DisableFileSync /t REG_DWORD /d 1 /f | Out-Null

# 3) Remover apps UWP (inclusive Store, Cortana, Widgets, Xbox, etc.)
$appsToRemove = @(
  "Microsoft.Bing*","Microsoft.WindowsMaps","Microsoft.MicrosoftNews","Microsoft.News",
  "Microsoft.Xbox*","Microsoft.GamingApp",
  "Microsoft.ZuneMusic","Microsoft.ZuneVideo",
  "Microsoft.3DBuilder","Microsoft.Print3D","Microsoft.Microsoft3DViewer","Microsoft.People",
  "Microsoft.Whiteboard","Microsoft.MicrosoftStickyNotes","Microsoft.MicrosoftOfficeHub","Microsoft.SkypeApp",
  "Microsoft.GetHelp","Microsoft.WindowsFeedbackHub","Microsoft.YourPhone","Microsoft.Getstarted",
  "Microsoft.Windows.Photos","Microsoft.WindowsCamera",
  "Microsoft.549981C3F5F10",   # Cortana
  "MicrosoftWindows.Client.WebExperience", # Widgets
  "Microsoft.WindowsStore",    # Store
  "Microsoft.MSPaint","Microsoft.Todos","Microsoft.OneConnect"
)

foreach ($p in $appsToRemove) {
  Get-AppxPackage -AllUsers $p | Remove-AppxPackage -ErrorAction SilentlyContinue
  Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $p } | ForEach-Object {
    Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName -ErrorAction SilentlyContinue | Out-Null
    Write-Host "   Removido: $($_.DisplayName)"
  }
}

# 4) Desabilitar tarefas agendadas de telemetria
$tasksToDisable = @(
  "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
  "\Microsoft\Windows\Application Experience\ProgramDataUpdater",
  "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
  "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
  "\Microsoft\Windows\Feedback\Siuf\DmClient",
  "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload",
  "\Microsoft\Windows\Maps\MapsUpdateTask",
  "\Microsoft\Windows\Windows Error Reporting\QueueReporting",
  "\Microsoft\XblGameSave\XblGameSaveTask"
)

foreach ($t in $tasksToDisable) {
  try {
    schtasks /Change /TN $t /Disable | Out-Null
    Write-Host "   Tarefa desativada: $t"
  } catch { Write-Host "   Não encontrada: $t" }
}

Write-Host "✅ Debloat hardcore concluído (Spooler mantido ativo). Reinicie o PC."
