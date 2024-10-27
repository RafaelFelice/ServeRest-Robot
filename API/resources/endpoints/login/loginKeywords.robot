*** Settings ***
Documentation       This class has login keywords.
Resource            ../../utils/Base.robot

*** Keywords ***
Login by Api
    [Arguments]            ${ENDPOINT}=${EMPTY}
    ...                    ${EMAIL}=${EMPTY}
    ...                    ${PASSWORD}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json
    
    ${Body}                Create Dictionary    
    ...                    email=${EMAIL}
    ...                    password=${PASSWORD}  

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            POST On Session 
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}