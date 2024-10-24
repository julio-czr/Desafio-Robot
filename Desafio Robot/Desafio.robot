*** Settings ***

Resource         Teste_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste Uso do Loop - Fazer várias avaliações
    Entrar na Pagina de Login
    Fazer Login
    Entrar na pagina de restaurante
    Fazer Varias Avaliacoes
    Capturar Tela

Caso de Teste Uso de Condição - Fazer Avaliação Apenas se Houver Texto
    Entrar na Pagina de Login
    Fazer Login
    Entrar na pagina de restaurante
    Fazer Avaliacao Condicional    ${aval}
    Capturar Tela

Caso de Teste Uso de Busca - Clicar no Link com Apenas Parte do Texto
    Abrir o Navegador
    Entrar na Pagina de Login
    Fazer Login
    Clicar No Link Com Parte Do Texto    Olá
    Capturar Tela