*** Settings ***
Documentation    This page has all the useful keywords for login.
Resource         ../../Base.robot

*** Keywords ***
Login
    [Arguments]           ${email}    ${password}
    Input Text            ${LOGIN_INPUT_EMAIL}    ${email}
    Input Password        ${LOGIN_INPUT_PASSWORD}    ${password}
    Click Element         ${LOGIN_BTN_SUBMIT}