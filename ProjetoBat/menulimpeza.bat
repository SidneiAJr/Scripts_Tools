@echo off
title Menu do Guri - Ferramentas Windows
color 0A

:MENU
cls
echo ====================================================
echo                 MENU DE FERRAMENTAS
echo ====================================================
echo 1. Abrir Notepad
echo 2. Abrir Firefox
echo 3. Abrir Ferramenta de Captura
echo 4. Abrir Painel de Controle
echo 5. Abrir Chrome
echo 6. Abrir DxDiag
echo 7. Abrir Gerenciador de Tarefas
echo 8. Limpar Pastas TEMP
echo 9. Sair
echo ====================================================
set /p opcao=Escolha uma opcao (1 a 9): 

if "%opcao%"=="1" goto abrir_notepad
if "%opcao%"=="2" goto abrir_firefox
if "%opcao%"=="3" goto abrir_snipping
if "%opcao%"=="4" goto abrir_control
if "%opcao%"=="5" goto abrir_chrome
if "%opcao%"=="6" goto abrir_dxdiag
if "%opcao%"=="7" goto abrir_taskmgr
if "%opcao%"=="8" goto limpa_temp
if "%opcao%"=="9" exit

REM Caso opcao invalida
echo Opcao invalida! Tente de novo.
pause
goto MENU

:abrir_notepad
start notepad.exe
goto MENU

:abrir_firefox
start firefox.exe
goto MENU

:abrir_snipping
start SnippingTool.exe
goto MENU

:abrir_control
start control
goto MENU

:abrir_chrome
start chrome.exe
goto MENU

:abrir_dxdiag
start dxdiag.exe
goto MENU

:abrir_taskmgr
start taskmgr.exe
goto MENU

:limpa_temp
echo.
echo Limpando arquivos temporarios...
rd /s /q "%temp%" 2>nul
md "%temp%"
rd /s /q "C:\Windows\Temp" 2>nul
md "C:\Windows\Temp"
rd /s /q "C:\Windows\Prefetch" 2>nul
md "C:\Windows\Prefetch"
echo Limpeza concluida com sucesso!
pause
goto MENU
