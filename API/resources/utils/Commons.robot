*** Settings ***
Documentation       This class has all the common keywords.
Resource            Base.robot

*** Keywords ***
Create a new user
    ${FAKER_NAME_USER}                   First Name
    ${FAKER_PASSWORD_USER}               Password    10    False    
    Set Test Variable                  ${FAKER_NAME_USER}
    Set Test Variable                  ${FAKER_PASSWORD_USER}

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
    [Arguments]    ${ID}=${EMPTY}

    ${Headers}    Create Dictionary
    ...           Content-Type=application/json

    Create Session    alias=ServeRest    url=${URL_BASE_API}    verify=True
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