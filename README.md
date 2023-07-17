# Script Onboarding Editora Globo

Este documento fornece uma explicação completa sobre o uso e as opções disponíveis no script "onboarding.sh".<br>
O script é destinado a auxiliar no processo de configuração inicial do computador da ***Editora Globo***, fornecendo um menu interativo com várias opções de configuração.

---

### Como usar o script
Abra um terminal no seu computador. <br>
Navegue até o diretório onde o script `"onboarding.sh"` está localizado. <br>
Execute o seguinte comando para iniciar o script:
```bash
./onboarding.sh
```
O menu principal será exibido com uma lista de opções. Digite o número correspondente à opção desejada e pressione Enter.<br>
Dependendo da opção selecionada, você pode ser solicitado a fornecer informações adicionais ou confirmar a execução de determinados comandos.

---
### Funções do script
O script `"onboarding.sh"` possui as seguintes funções:

- Opção 1: Atualize os pacotes e dependências do Linux.
Esta opção executa os comandos necessários para atualizar os pacotes e dependências do sistema operacional Linux.

- Opção 2: Instale o Docker.
Esta opção executa os comandos necessários para instalar e configurar o Docker no sistema.

- Opção 3: Instale o Backstage CLI.
Esta opção instala o Backstage CLI, uma ferramenta de linha de comando para interagir com o Backstage da Editora Globo.

- Opção 4: Gere sua chave SSH.
Esta opção orienta o usuário a gerar uma chave SSH para uso com o GitLab e GitHub.

- Opção 5: Instalar VPN. (Instale o Docker antes.)
Esta opção permite ao usuário clonar e configurar a VPN da Editora Globo usando o Docker.

- Opção 6: Pacotes essenciais.
Esta opção exibe um submenu com opções para instalar pacotes essenciais para o desenvolvimento.

- Opção 7: Programas essenciais.
Esta opção exibe um submenu com opções para instalar programas essenciais para o desenvolvimento na Editora Globo.

### Considerações finais
O script `"onboarding.sh"` automatiza várias etapas do processo de configuração inicial do computador da Editora Globo, tornando o processo mais fácil e rápido. Certifique-se de ler as mensagens e instruções fornecidas durante a execução do script, pois algumas opções podem exigir etapas adicionais.

Este documento fornece uma visão geral do script e suas funcionalidades. Consulte o código fonte do script para obter mais detalhes sobre a implementação das funções e os comandos executados.

***Este script foi desenvolvido especificamente para uso na Editora Globo e pode não ser adequado para outros ambientes ou casos de uso.***