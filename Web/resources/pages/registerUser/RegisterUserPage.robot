*** Settings ***
Documentation    This page has all the useful keywords for register a new user.
Resource         ../../Base.robot

*** Keywords ***
Register a new user
    [Arguments]           ${name}    ${email}    ${password}
    Click Element         ${LOGIN_LINK_REGISTER}
    Input Text            ${REGISTER_INPUT_NAME}    ${name}
    Input Text            ${REGISTER_INPUT_EMAIL}    ${email}
    Input Password        ${REGISTER_INPUT_PASSWORD}    ${password}
    Click Element         ${REGISTER_CHECKBOX_ADMIN}
    Click Element         ${REGISTER_BUTTON_REGISTER}