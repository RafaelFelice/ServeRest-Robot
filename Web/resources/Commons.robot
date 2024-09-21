*** Settings ***
Documentation       This class has all the common keywords.
Resource            Base.robot

*** Keywords ***
Register user
    ${FAKER_NAME_USER}                   First Name
    ${FAKER_PASSWORD_USER}               Password    10    False    
    Set Global Variable                  ${FAKER_NAME_USER}
    Set Global Variable                  ${FAKER_PASSWORD_USER}

Register product
    ${FAKER_NAME_PRODUCT}                Company
    ${FAKER_PRICE_PRODUCT}               Building Number
    ${FAKER_DESCRIPTION_PRODUCT}         Paragraph
    ${FAKER_QUANTITY_PRODUCT}            Building Number
    Set Global Variable                  ${FAKER_NAME_PRODUCT}
    Set Global Variable                  ${FAKER_PRICE_PRODUCT}
    Set Global Variable                  ${FAKER_DESCRIPTION_PRODUCT}
    Set Global Variable                  ${FAKER_QUANTITY_PRODUCT}

Verify error: ${text}
    Wait Until Page Contains             ${text}
    Log                                  ${text}