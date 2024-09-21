*** Settings ***
Documentation    This page has all the useful keywords for register a new product.
Resource         ../../Base.robot

*** Keywords ***
Register a new product
    [Arguments]           ${name}    ${price}    ${description}    ${quantity}
    Wait Until Element Is Visible     ${HOME_LINK_REGISTER_PRODUCTS}    5
    Click Element                     ${HOME_LINK_REGISTER_PRODUCTS}
    Input Text                        ${PRODUCT_INPUT_NAME}    ${name}
    Input Text                        ${PRODUCT_INPUT_PRICE}    ${price}  
    Wait Until Element Is Enabled     ${PRODUCT_INPUT_DESCRIPTION}    100
    Clear Element Text                ${PRODUCT_INPUT_DESCRIPTION}
    Input Text                        ${PRODUCT_INPUT_DESCRIPTION}    ${description}
    Input Text                        ${PRODUCT_INPUT_QUANTITY}    ${quantity}
    Click Element                     ${PRODUCT_BTN_REGISTER_PRODUCTS}