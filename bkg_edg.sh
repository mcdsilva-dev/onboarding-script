#!/bin/bash

exibir_menu() {
    echo "Script de onboarding para configuração do computador da Editora Globo."
    echo
    echo "Selecione uma opção abaixo:"
    echo "1. Atualize os pacotes e dependências do Linux."
    echo "2. Instale o Docker."
    echo "3. Instale o Backstage CLI."
    echo "4. Gere sua chave SSH."
    echo "5. Pacotes essenciais."
    echo "6. Sair"
}

executar_comandos() {
    for comando in "$@"; do
        echo "Executando: $comando"
        eval "$comando" >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Erro ao executar: $comando"
        fi
    done
    echo "Comandos executados."
}

processar_opcao() {
    read -p "Digite o número da opção desejada: " opcao
    case $opcao in
        1)
            echo "Executando Atualizações do Linux."
            executar_comandos "sudo apt upgrade" "sudo apt update -y" >/dev/null
            echo
            echo "Atualizações realizadas com sucesso."
            ;;
        2)
            echo "Executando instalação e configuração necessárias do Docker."
            executar_comandos "sudo apt install docker.io docker-compose docker -y" \
                "sudo groupadd docker" \
                "sudo usermod -aG docker $USER" \
                "sudo systemctl enable docker" \
                "sudo systemctl start docker"
            submenu_docker
            ;;
        3)
            echo "Instalando o Backstage CLI 🍺"
            executar_comandos "sudo apt install curl" >/dev/null
            executar_comandos "sudo curl https://get.backstage.globoi.com/ | sh"
            echo
            echo "Atualizações realizadas com sucesso."
            ;;
        4)
            echo "Para gerar sua chave SSH:"
            echo "APENAS APERTE ENTER, NÃO ESCREVA NADA DO QUE SOLICITAR, DEIXE OS CAMPOS EM BRANCO."
            read -p "Digite seu endereço de e-mail: " email
            ssh-keygen -t rsa -b 4096 -C "$email"
            echo
            echo "Chave SSH gerada com sucesso. Pegue ela abaixo:"
            cat ~/.ssh/id_rsa.pub
            echo
            echo "Copie a chave completa acima menos seu e-mail, feito isso, vá ao gitlab no link https://gitlab.globoi.com/-/profile/keys e no Github https://github.com/settings/keys, pode ser utilizado a mesma chave."
            echo
            echo "Adicione um nome em "Title", cole sua chave gerada e clique em "Add key". Feito isso, você poderá clonar os repositórios da Editora, caso tenha acesso."
            ;;
        5)
            essentials_packages
            ;;
        6)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
}

essentials_packages() {
    clear
    echo "Pacotes essenciais para desenvolvimento."
    echo
    echo "Selecione uma opção abaixo:"
    echo "1. Instalar Python 3 e pip."
    echo "2. Instalar Node."
    echo "3. Instalar NVM."
    echo "4. Instalar Virtual ENV."
    echo "5. Instalar ZSH (Recomendado)"
    echo "6. Voltar"

    read -p "Digite o número da opção desejada: " subopcao
    case $subopcao in
        1)
            echo "Instalando python3 e pip..."
            executar_comandos "sudo apt install python3 python3-pip" >/dev/null
            echo
            echo "Instalação do python3 e pip concluída"
            ;;
        2)
            echo "Instalando NodeJS"
            executar_comandos "sudo apt install nodejs" >/dev/null
            echo
            echo "Instalação do NodeJS concluída"
            ;;
        3)
            echo "Instalando NVM. Para isso, vamos precisar instalar o CURL."
            executar_comandos "sudo apt install curl" >/dev/null
            executar_comandos "sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash" >/dev/null
            source ~/.bashrc
            echo
            echo "Instalação do NVM concluída."
            ;;
        4)
            echo "Instalando VENV."
            executar_comandos "sudo apt install python3-venv" >/dev/null
            echo
            echo "Instalação do VENV concluída."
            ;;
        5)
            echo "Instalando o ZSH."
            executar_comandos "sudo apt install zsh -y"
            echo
            echo "Zsh instalado com sucesso!"
            echo
            echo -n "Em 10 segundos o shell será reiniciado, após isso execute novamente o script."
            sleep 10
            exec zsh
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            submenu_docker
            ;;
    esac
}

submenu_docker() {
    clear
    echo "Configurações adicionais do Docker:"
    echo "Selecione uma opção abaixo:"
    echo "1. Criar arquivo em /etc/docker."
    echo "2. Voltar"

    read -p "Digite o número da opção desejada: " subopcao
    case $subopcao in
        1)
            echo "Criando arquivo daemon.json em /etc/docker..."
            echo -e '{\n    "bip": "172.26.0.1/16",\n    "fixed-cidr": "172.26.0.0/16"\n}' \
            | sudo tee /etc/docker/daemon.json >/dev/null

            echo "Arquivo /etc/docker/daemon.json criado com sucesso."
            ;;
        2)
            echo "Voltando..."
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            submenu_docker
            ;;
    esac
}




while true; do
    exibir_menu
    processar_opcao
    echo -n "Retornando ao menu principal em 10 segundos..."
    sleep 10
    clear
done
