#!/bin/bash

# Função para exibir o menu
mostrar_menu() {
    clear
    echo "===================================="
    echo "       MENU DE OPÇÕES"
    echo "===================================="
    echo "1) Exibir data e hora"
    echo "2) Listar arquivos no diretório atual"
    echo "3) Mostrar espaço livre em disco"
    echo "4) Sair"
    echo "===================================="
    echo -n "Escolha uma opção [1-4]: "
}

# Função 1: Exibir data e hora
exibir_data_hora() {
    echo "Data e Hora Atual: $(date)"
    pause
}

# Função 2: Listar arquivos no diretório atual
listar_arquivos() {
    echo "Arquivos no diretório atual:"
    ls -l
    pause
}

# Função 3: Mostrar espaço livre em disco
mostrar_espaco_disco() {
    echo "Espaço livre no disco:"
    df -h
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
        1) exibir_data_hora ;;
        2) listar_arquivos ;;
        3) mostrar_espaco_disco ;;
        4) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida. Tente novamente."; pause ;;
    esac
done
