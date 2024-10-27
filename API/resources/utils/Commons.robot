*** Settings ***
Documentation       This class has all the common keywords.
Resource            Base.robot

*** Keywords ***
Create a new user
    ${FAKER_NAME_USER}                   First Name
    ${FAKER_PASSWORD_USER}               Password    10    False    
    Set Test Variable                    ${FAKER_NAME_USER}
    Set Test Variable                    ${FAKER_PASSWORD_USER}

Create a new product by Api
    ${FAKER_NAME_PRODUCT}                Company
    ${FAKER_PRICE_PRODUCT}               Building Number
    ${FAKER_DESCRIPTION_PRODUCT}         Paragraph
    ${FAKER_QUANTITY_PRODUCT}            Building Number
    Set Global Variable                  ${FAKER_NAME_PRODUCT}
    Set Global Variable                  ${FAKER_PRICE_PRODUCT}
    Set Global Variable                  ${FAKER_DESCRIPTION_PRODUCT}
    Set Global Variable                  ${FAKER_QUANTITY_PRODUCT}

Get Token
    Login by Api                        ${PATH.login}    ${default_email}    ${default_password}
    Should Be Equal As Numbers          ${response.status_code}                 200
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Test Variable                   ${TOKEN}                                ${response.json()["authorization"]}
    Log                                 ${TOKEN}

Get id
    [Arguments]                         ${ENDPOINT}=${EMPTY}
    ...                                 ${ID}=${EMPTY}

    ${Headers}                          Create Dictionary
    ...                                 Content-Type=application/json

    Create Session                      alias=ServeRest    url=${URL_BASE_API}    verify=True
    ${Response}                         GET On Session
    ...                                 alias=ServeRest   
    ...                                 url=${ENDPOINT}/${ID}
    ...                                 headers=${Headers}
    ...                                 expected_status=any
      
    Log                                 ${Response}
    Set Test Variable                   ${Response}