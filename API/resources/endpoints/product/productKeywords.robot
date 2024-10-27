*** Settings ***
Documentation       This class has product keywords.
Resource            ../../utils/Base.robot

*** Keywords ***
Register a new product by Api
    [Arguments]            ${ENDPOINT}=${EMPTY}
    ...                    ${TOKEN}=${EMPTY}
    ...                    ${FAKER_NAME_PRODUCT}=${EMPTY}
    ...                    ${FAKER_PRICE_PRODUCT}=${EMPTY}
    ...                    ${FAKER_DESCRIPTION_PRODUCT}=${EMPTY}
    ...                    ${FAKER_QUANTITY_PRODUCT}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json
    ...                    authorization=${TOKEN}

    ${Body}                Create Dictionary    
    ...                    nome=${FAKER_NAME_PRODUCT}
    ...                    preco=${FAKER_PRICE_PRODUCT}
    ...                    descricao=${FAKER_DESCRIPTION_PRODUCT} 
    ...                    quantidade=${FAKER_QUANTITY_PRODUCT}   

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            POST On Session 
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}
    ...                    headers=${Headers}
    ...                    json=${Body}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}  

Delete product by id
    [Arguments]
    ...                    ${ENDPOINT}=${EMPTY}
    ...                    ${ID}=${EMPTY}

    ${Headers}             Create Dictionary
    ...                    Content-Type=application/json
    ...                    authorization=${TOKEN}

    Create Session         alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}            DELETE On Session
    ...                    alias=ServeRest   
    ...                    url=${ENDPOINT}/${ID}
    ...                    headers=${Headers}
    ...                    expected_status=any
      
    Log                    ${Response}
    Set Test Variable      ${Response}