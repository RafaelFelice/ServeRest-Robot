*** Settings ***
Documentation       This class has all the common keywords.
Resource            Base.robot

*** Keywords ***
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