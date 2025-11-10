cd ~
cat > gerenciador.sh << 'EOF'
#!/bin/bash

exibir_cabecalho() {
    clear
    echo "###############################################################"
    echo "# IBMEC                                                       #"
    echo "# Sistemas Operacionais                    Semestre 2025      #"
    echo "# Código: IBM8940                          Turma: 8001        #"
    echo "# Professor: Luiz Fernando T. de Farias                       #"
    echo "#-------------------------------------------------------------#"
    echo "# Avaliação Contínua (AC) - Gerenciador de Sistema            #"
    echo "#-------------------------------------------------------------#"
    echo "# Aluno: Guilherme Dias e Luiz Fabiano                        #"
    echo "#-------------------------------------------------------------#"
    DATA=$(date +"%d de %B de %Y")
    HORA=$(date +"%H Horas e %M Minutos")
    echo "# Rio de Janeiro, $DATA                      #"
    echo "# Hora do Sistema: $HORA                     #"
    echo "###############################################################"
    echo ""
}

exibir_menu() {
    echo "Menu de Escolhas:"
    echo "  1) Informacoes do Sistema"
    echo "  2) Listar Arquivos do Diretorio"
    echo "  3) Monitorar Processos em Execucao"
    echo "  4) Informacoes do Usuario Atual"
    echo "  5) Finalizar o Programa"
    echo ""
    echo -n "Digite sua escolha [1-5]: "
}

info_sistema() {
    echo ""
    echo "========== INFORMACOES DO SISTEMA =========="
    echo "Kernel: $(uname -s)"
    echo "Versao do Kernel: $(uname -r)"
    echo "Arquitetura: $(uname -m)"
    echo "Nome do Host: $(hostname)"
    echo "Uptime do Sistema:"
    uptime
    echo "==========================================="
    echo ""
    read -p "Pressione ENTER para continuar..."
}

listar_arquivos() {
    echo ""
    echo "========== LISTAR ARQUIVOS =========="
    echo -n "Digite o caminho do diretorio (ou . para atual): "
    read DIRETORIO
    
    if [ -d "$DIRETORIO" ]; then
        echo ""
        echo "Listagem de: $DIRETORIO"
        ls -lh "$DIRETORIO"
    else
        echo "ERRO: Diretorio nao existe!"
    fi
    echo "======================================="
    read -p "Pressione ENTER para continuar..."
}

monitorar_processos() {
    echo ""
    echo "========== PROCESSOS DO USUARIO =========="
    echo "Usuario: $(whoami)"
    ps -u $(whoami)
    echo "=========================================="
    read -p "Pressione ENTER para continuar..."
}

info_usuario() {
    echo ""
    echo "========== INFORMACOES DO USUARIO =========="
    echo "Usuario: $(whoami)"
    echo "ID do Usuario e Grupos:"
    id
    echo "Diretorio Home: $HOME"
    echo "Shell: $SHELL"
    echo "=========================================="
    read -p "Pressione ENTER para continuar..."
}

finalizar() {
    echo ""
    echo "========== ENCERRAMENTO =========="
    echo "Programa finalizado em: $(date +"%d/%m/%Y as %H:%M:%S")"
    echo "Obrigado por usar o Gerenciador de Sistema!"
    echo "===================================="
    exit 0
}

while true; do
    exibir_cabecalho
    exibir_menu
    read OPCAO
    
    case $OPCAO in
        1) info_sistema ;;
        2) listar_arquivos ;;
        3) monitorar_processos ;;
        4) info_usuario ;;
        5) finalizar ;;
        *) echo "ERRO: Opcao invalida!"; read -p "Pressione ENTER..." ;;
    esac
done
EOF
