*** Settings ***
Documentation       This class has user keywords.
Resource            ../../utils/Base.robot

*** Keywords ***
Register a new user by Api
    [Arguments]            ${ENDPOINT}=${EMPTY}
    ...                    ${NAME}=${EMPTY}
    ...                    ${EMAIL}=${EMPTY}
    ...                    ${PASSWORD}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json

    ${Body}                Create Dictionary    
    ...                    nome=${NAME}
    ...                    email=${EMAIL}
    ...                    password=${PASSWORD}   
    ...                    administrador=true    

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            POST On Session 
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}  

Change a new user by Api
    [Arguments]            ${ENDPOINT}=${EMPTY}
    ...                    ${ID}=${EMPTY}
    ...                    ${NAME}=${EMPTY}
    ...                    ${EMAIL}=${EMPTY}
    ...                    ${PASSWORD}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json

    ${Body}                Create Dictionary    
    ...                    nome=${NAME}
    ...                    email=${EMAIL}
    ...                    password=${PASSWORD}   
    ...                    administrador=true    

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            PUT On Session 
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}/${ID}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}

Delete user by id
    [Arguments]            ${ENDPOINT}=${EMPTY}
    ...                    ${ID}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            DELETE On Session
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}/${ID}
    ...                    headers=${Headers}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}