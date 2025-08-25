@echo off
:MENU
cls
echo *************************************
echo ===============MENU==================
echo *************************************
echo.
echo 1. Abrir o Notepad
echo 2. Abrir Firefox
echo 3. Abrir ferramenta de captura
echo 4. Abrir painel de controle
echo 5. Abrir Chrome
echo 6. Abrir ferramenta do Dxdiag
echo 7. Abrir Gerenciador de Tarefas
echo 8. Sair
set /p opcao=Escolha uma opcao (1 a 8): 

if "%opcao%"=="1" goto abrir_notepad
if "%opcao%"=="2" goto abrir_firefox
if "%opcao%"=="3" goto abrir_ferrawindowscapture
if "%opcao%" =="4" goto abrir_control
if "%opcao%" =="5" goto abrir_chrome
if "%opcao%" =="6" goto abrir_dxdiag
if "%opcao%" =="7" goto abrir_gertarefas
if "%opcao%"=="8" exit
:abrir_notepad
start notepad.exe
goto MENU
:abrir_firefox
start firefox.exe
goto MENU
:abrir_ferrawindowscapture
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
:abrir_gertarefas
start taskmgr.exe
goto MENU

