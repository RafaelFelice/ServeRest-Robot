*** Settings ***
Documentation       This class has all the common keywords.
Resource            Base.robot

*** Keywords ***
Register user
    ${FAKER_NAME}        First Name
    ${FAKER_PASSWORD}    Password    10    False    
    Set Global Variable    ${FAKER_NAME}
    Set Global Variable    ${FAKER_PASSWORD}

Verify error: ${text}
    Wait Until Page Contains    ${text}
    Log                         ${text}