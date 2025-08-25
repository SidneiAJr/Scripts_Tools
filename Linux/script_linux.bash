#!/bin/bash

while true; do
    clear
    echo "====================================="
    echo "           MENU PRINCIPAL"
    echo "====================================="
    echo "1) Atualizar sistema"
    echo "2) Mostrar data e hora"
    echo "3) Mostrar uso de disco"
    echo "4) Mostrar processos ativos"
    echo "5) Sair"
    echo "====================================="
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1)
            echo "Atualizando sistema..."
            sudo apt update && sudo apt upgrade -y
            read -p "Pressione Enter para continuar..."
            ;;
        2)
            date
            read -p "Pressione Enter para continuar..."
            ;;
        3)
            df -h
            read -p "Pressione Enter para continuar..."
            ;;
        4)
            ps aux --sort=-%mem | head -n 10
            read -p "Pressione Enter para continuar..."
            ;;
        5)
            echo "Saindo... valeu!"
            exit 0
            ;;
        *)
            echo "Opção inválida!"
            sleep 1
            ;;
    esac
done
