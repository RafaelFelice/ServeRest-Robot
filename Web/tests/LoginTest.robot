*** Settings ***
Documentation      This suite has goal to test the login feature.
Resource           ../resources/Base.robot
Test Setup        Access page serverest
Test Teardown     Close Browser

*** Test Cases ***
CT01: Login successfully
    [Tags]    regression    smoke
    Login    ${default_email}    ${default_password}
    Wait Until Page Contains Element    ${HOME_BTN_LOGOUT}

CT02: Login unsuccessfully with invalid email
    [Tags]    regression
    Login    ${invalid_email}    ${default_password}
    Verify error: ${msg_invalid_email_or_password}

CT03: Login unsuccessfully with invalid password
    [Tags]    regression
    Login    ${default_email}    ${invalid_password}
    Verify error: ${msg_invalid_email_or_password}

CT04: Login unsuccessfully with invalid email and invalid password
    [Tags]    regression
    Login    ${invalid_email}    ${invalid_password}
    Verify error: ${msg_invalid_email_or_password}

CT05: Login unsuccessfully with blank email
    [Tags]    regression
    Login    ${blank_email}    ${default_password}
    Verify error: ${msg_blank_email}

CT06: Login unsuccessfully with blank password
    [Tags]    regression
    Login    ${default_email}    ${blank_password}
    Verify error: ${msg_blank_password}

CT07: Login unsuccessfully with blank email and blank password
    [Tags]    regression
    Login    ${blank_email}    ${blank_password}
    Verify error: ${msg_blank_email}
    Verify error: ${msg_blank_password}