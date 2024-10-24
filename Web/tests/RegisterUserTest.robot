*** Settings ***
Documentation      This suite has goal to test the register user feature from website
Resource           ../resources/Base.robot
Test Setup         run keywords 
...                Access page serverest
...                Register user
Test Teardown      Close Browser

*** Test Cases ***
CT01: Register a new user successfully
    [Tags]    regression    smoke
    Register a new user    ${FAKER_NAME_USER}    ${FAKER_NAME_USER}@qa.com    ${FAKER_PASSWORD_USER}    
    Wait Until Page Contains Element    ${HOME_BTN_LOGOUT}

CT02: Register a new user unsuccessfully with email registered
    [Tags]    regression
    Register a new user    ${FAKER_NAME_USER}    ${default_email}    ${FAKER_PASSWORD_USER} 
    Verify error: ${msg_invalid_email_registered}

CT03: Register a new user unsuccessfully with blank name
    [Tags]    regression
    Register a new user    ${blank_name}    ${default_email}    ${FAKER_PASSWORD_USER} 
    Verify error: ${msg_blank_name}

CT04: Register a new user unsuccessfully with blank email
    [Tags]    regression
    Register a new user    ${FAKER_NAME_USER}    ${blank_email}    ${FAKER_PASSWORD_USER} 
    Verify error: ${msg_blank_email}

CT05: Register a new user unsuccessfully with blank password
    [Tags]    regression
    Register a new user    ${FAKER_NAME_USER}    ${FAKER_NAME_USER}@qa.com    ${blank_password} 
    Verify error: ${msg_blank_password}

CT06: Register a new user unsuccessfully with blank name and blank email
    [Tags]    regression
    Register a new user    ${blank_name}    ${blank_email}    ${FAKER_PASSWORD_USER} 
    Verify error: ${msg_blank_name}
    Verify error: ${msg_blank_email}

CT07: Register a new user unsuccessfully with blank name and blank password
    [Tags]    regression
    Register a new user    ${blank_name}    ${FAKER_NAME_USER}@qa.com    ${blank_password} 
    Verify error: ${msg_blank_name}
    Verify error: ${msg_blank_password}

CT08: Register a new user unsuccessfully with blank name, blank email and blank password
    [Tags]    registerUser
    Register a new user    ${blank_name}    ${blank_email}    ${blank_password} 
    Verify error: ${msg_blank_name}
    Verify error: ${msg_blank_email}
    Verify error: ${msg_blank_password}

CT09: Register a new user unsuccessfully with blank email and blank password
    [Tags]    registerUser
    Register a new user    ${FAKER_NAME_USER}    ${blank_email}    ${blank_password} 
    Verify error: ${msg_blank_email}
    Verify error: ${msg_blank_password}