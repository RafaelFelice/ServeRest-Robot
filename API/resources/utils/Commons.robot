*** Settings ***
Documentation       This class has all the common keywords.
Resource            Base.robot

*** Keywords ***
Create a new user
    ${FAKER_NAME_USER}                   First Name
    ${FAKER_PASSWORD_USER}               Password    10    False    
    Set Test Variable                    ${FAKER_NAME_USER}
    Set Test Variable                    ${FAKER_PASSWORD_USER}

Login by Api
    [Arguments]    
    ...            ${EMAIL}=${EMPTY}
    ...            ${PASSWORD}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json
    
    ${Body}    Create Dictionary    
    ...        email=${EMAIL}
    ...        password=${PASSWORD}  

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            POST On Session 
    ...                    alias=ServeRest   
    ...                    url=${PATH.login}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}

Register a new user by Api
    [Arguments]    ${NAME}=${EMPTY}
    ...            ${EMAIL}=${EMPTY}
    ...            ${PASSWORD}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json

    ${Body}    Create Dictionary    
    ...        nome=${NAME}
    ...        email=${EMAIL}
    ...        password=${PASSWORD}   
    ...        administrador=true    

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            POST On Session 
    ...                    alias=ServeRest   
    ...                    url=${PATH.user}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}  

Get user by id
    [Arguments]            ${ID}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            GET On Session
    ...                    alias=ServeRest   
    ...                    url=${PATH.user}/${ID}
    ...                    headers=${Headers}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}

Change a new user by Api
    [Arguments]    
    ...            ${ID}=${EMPTY}
    ...            ${NAME}=${EMPTY}
    ...            ${EMAIL}=${EMPTY}
    ...            ${PASSWORD}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json

    ${Body}    Create Dictionary    
    ...        nome=${NAME}
    ...        email=${EMAIL}
    ...        password=${PASSWORD}   
    ...        administrador=true    

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            PUT On Session 
    ...                    alias=ServeRest   
    ...                    url=${PATH.user}/${ID}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}

Delete user by id
    [Arguments]    ${ID}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            DELETE On Session
    ...                    alias=ServeRest   
    ...                    url=${PATH.user}/${ID}
    ...                    headers=${Headers}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}

Create a new product by Api
    ${FAKER_NAME_PRODUCT}                Company
    ${FAKER_PRICE_PRODUCT}               Building Number
    ${FAKER_DESCRIPTION_PRODUCT}         Paragraph
    ${FAKER_QUANTITY_PRODUCT}            Building Number
    Set Global Variable                  ${FAKER_NAME_PRODUCT}
    Set Global Variable                  ${FAKER_PRICE_PRODUCT}
    Set Global Variable                  ${FAKER_DESCRIPTION_PRODUCT}
    Set Global Variable                  ${FAKER_QUANTITY_PRODUCT}

Register a new product by Api
    [Arguments]    ${TOKEN}
    ...            ${FAKER_NAME_PRODUCT}=${EMPTY}
    ...            ${FAKER_PRICE_PRODUCT}=${EMPTY}
    ...            ${FAKER_DESCRIPTION_PRODUCT}=${EMPTY}
    ...            ${FAKER_QUANTITY_PRODUCT}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json
    ...           authorization=${TOKEN}

    ${Body}    Create Dictionary    
    ...        nome=${FAKER_NAME_PRODUCT}
    ...        preco=${FAKER_PRICE_PRODUCT}
    ...        descricao=${FAKER_DESCRIPTION_PRODUCT} 
    ...        quantidade=${FAKER_QUANTITY_PRODUCT}   

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            POST On Session 
    ...                    alias=ServeRest   
    ...                    url=${PATH.products}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}  

Get Token
    Login by Api                        ${default_email}    ${default_password}
    Should Be Equal As Numbers          ${response.status_code}                 200
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Test Variable                   ${TOKEN}                                ${response.json()["authorization"]}
    Log                                 ${TOKEN}

Get product by id
    [Arguments]            ${ID}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            GET On Session
    ...                    alias=ServeRest   
    ...                    url=${PATH.products}/${ID}
    ...                    headers=${Headers}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}

Delete by id
    [Arguments]
    ...            ${ENDPOINT}=${EMPTY}
    ...            ${ID}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json
    ...           authorization=${TOKEN}

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            DELETE On Session
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}/${ID}
    ...                    headers=${Headers}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}