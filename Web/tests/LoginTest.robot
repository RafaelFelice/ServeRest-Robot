*** Settings ***
Documentation      This suite has goal to test the login feature.
Resource           ../resources/Base.robot
Test Setup        Access page serverest
Test Teardown     Close Browser

*** Test Cases ***
CT01: Login successfully
    [Tags]    login    regression
    Login    ${default_email}    ${default_password}
    Wait Until Page Contains Element    ${HOME_BTN_LOGOUT}

CT02: Login unsuccessfully with invalid email
    [Tags]    login
    Login    ${invalid_email}    ${default_password}
    Verify error: ${MSG_INVALID_EMAIL}

CT03: Login unsuccessfully with invalid password
    [Tags]    login
    Login    ${default_email}    ${invalid_password}
    Verify error: ${MSG_INVALID_PASSWORD}

CT02: Login unsuccessfully with invalid email and invalid password
    [Tags]    login
    Login    ${invalid_email}    ${invalid_password}
    Verify error: ${MSG_INVALID_EMAIL}
    Verify error: ${MSG_INVALID_PASSWORD}

CT02: Login unsuccessfully with blank email
    [Tags]    login
    Login    ${blank_email}    ${default_password}
    Verify error: ${MSG_BLANK_EMAIL}

CT02: Login unsuccessfully with blank password
    [Tags]    login
    Login    ${default_email}    ${blank_password}
    Verify error: ${MSG_BLANK_PASSWORD}

CT02: Login unsuccessfully with blank email and blank password
    [Tags]    login
    Login    ${blank_email}    ${blank_password}
    Verify error: ${MSG_BLANK_EMAIL}
    Verify error: ${MSG_BLANK_PASSWORD}