*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://dinnerboxd.shop
${BROWSER}    Chrome
${email}    julioramalho01@gmail.com
${password}    123
${aval}   Otimo restaurante


*** Keywords ***   
Abrir o Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window


Fechar o Navegador    
    Close Browser
  

Entrar na Pagina de Login
    Wait Until Page Contains Element    xpath=//a[@href='../HTML/logIn.html']
    Click Link    xpath=//a[@href='../HTML/logIn.html']
  
Fazer Login
    Wait Until Element Is Visible    id=email 
    Input Text    id=email    ${email} 
    Wait Until Element Is Visible    id=password 
    Input Text    id=password    ${password} 
    Click Button    Entrar
    
Entrar na pagina de restaurante
    Wait Until Element Is Visible    css=a.item-shelf
    Click Link    xpath=//a[@href='../HTML/restaurantPage.html?restaurant=3']
   
Fazer Avaliação Corretamente
    [Arguments]  ${aval}
    Wait Until Page Contains    Avaliações
    Input Text  id=review-text  ${aval}
    Click Element   css=span.star[data-value='3']
    Click Button    Enviar
    Sleep    2s
    Page Should Contain    ${aval}  

Fazer Avaliação Incorretamente
    Wait Until Page Contains    Avaliações
    Input Text  id=review-text  ${aval}
    Click Button    Enviar
    Sleep    2s
    Page Should Contain    ${aval}  


Capturar Tela
    Capture Page Screenshot



Fazer Avaliacao Condicional
    [Arguments]  ${aval}
    Run Keyword If    '${aval}' == ''    Log    "Campo de avaliação está vazio"
    ...    ELSE    
    ...        Fazer Avaliação Corretamente    ${aval}
    Sleep    2s
    Page Should Contain    ${aval}

Fazer Varias Avaliacoes
    ${avaliacoes}=    Create List    Otimo restaurante    Comida boa    Excelente serviço
    FOR    ${aval}    IN    @{avaliacoes}
        Fazer Avaliação Corretamente    ${aval}
    END

Clicar No Link Com Parte Do Texto
    [Arguments]  ${parte_do_texto}
    ${xpath}=    Set Variable    //b[contains(text(), '${parte_do_texto}')]
    Wait Until Element Is Visible    xpath=${xpath}
    Click Element    xpath=${xpath}
    Sleep    2s
