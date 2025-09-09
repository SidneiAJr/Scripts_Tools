#!/bin/bash

# Função para exibir o menu
mostrar_menu() {
    clear
    echo "===================================="
    echo "       MENU DE OPÇÕES"
    echo "===================================="
    echo "1) Instalar HTOP"
    echo "2) Instalar VIM"
    echo "3) Mostrar Espaço livre em disco"
    echo "4) Limpeza com Autoremove"
    echo "5) Atualização com Update"
    echo "6) Limpa Sistema com Comado Clean"
    echo "7) Chamar Firefox"
    echo "8) Verifica com Neofetch"
    echo "9) Instala NMAP"
    echo "10) Instala WINEHQ"
    echo "11) Roda DKPG configure --a"
    echo "12) Sair"
    
    echo "===================================="
    echo -n "Escolha uma opção [1-11]: "
}

# Função 1: Exibir data e hora
instalar_htop() {
    echo "Instalar HTOP"
    sudo apt install htop -y
    pause
}

# Função 2: Listar arquivos no diretório atual
instalar_vim() {
    echo "Instalar Vim"
    sudo apt install vim -y
    pause
}

# Função 3: Mostrar espaço livre em disco
mostrar_espaco_disco() {
    echo "Espaço livre no disco:"
    df -h
    pause
}
limpeza_de_disco(){
     echo "Limpeza de Disco"
     sudo apt autoremove -y
     pause
}
atualização_com_apt(){
    echo "Atualizar Sistema operacional"
    sudo apt update -y
    pause
}
limpa_distro(){
    echo "Limpa Sistema"
    sudo apt clean -y
    pause
}
chama_firefox(){
    echo "Chama O firefox"
    firefox
    pause
}
verifica_os(){
    echo "Roda o Neofetch"
    neofetch
    pause
}
instala_nmap(){
   echo "Instala o nmap"
   sudo apt install nmap -y
   pause
}
instala_WineHQ(){
   echo " Instala WineHQ para debian 11"
   sudo dpkg --add-architecture i386
   sudo mkdir -pm755 /etc/apt/keyrings
   wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
   sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
   pause
}
Conserta_depedencias(){
   echo "Conserta dependecia"
   sudo dpkg --configure -a
   pause
}

# Função para pausar a execução e voltar ao menu
pause() {
    read -p "Pressione [Enter] para continuar..."
}

# Loop principal
while true; do
    mostrar_menu
    read opcao
    case $opcao in
        1) instalar_htop ;;
        2) instalar_vim ;;
        3) mostrar_espaco_disco ;;
        4) limpeza_de_disco;;
        5) atualização_com_apt;;
        6) limpa_distro;;
        7) chama_firefox;;
        8) verifica_os;;
        9) instala_nmap;;
        10)instala_WineHQ;;
        11)Conserta_depedencias;;
        12) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida. Tente novamente."; pause ;;
    esac
done
