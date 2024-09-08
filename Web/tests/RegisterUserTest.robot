*** Settings ***
Documentation      This suite has goal to test the register user feature.
Resource           ../resources/Base.robot
Test Setup         run keywords 
...                Access page serverest
...                Register user
Test Teardown      Close Browser

*** Test Cases ***
CT01: Register a new user successfully
    [Tags]    registerUser    regression
    Register a new user    ${FAKER_NAME}    ${FAKER_NAME}@qa.com    ${FAKER_PASSWORD}    
    Wait Until Page Contains Element    ${HOME_BTN_LOGOUT}

CT02: Register a new user unsuccessfully with email registered
    [Tags]    registerUser
    Register a new user    ${FAKER_NAME}    ${default_email}    ${FAKER_PASSWORD} 
    Verify error: ${msg_invalid_email_registered}

CT03: Register a new user unsuccessfully with blank name
    [Tags]    registerUser
    Register a new user    ${blank_name}    ${default_email}    ${FAKER_PASSWORD} 
    Verify error: ${msg_blank_name}

CT04: Register a new user unsuccessfully with blank email
    [Tags]    registerUser
    Register a new user    ${FAKER_NAME}    ${blank_email}    ${FAKER_PASSWORD} 
    Verify error: ${msg_blank_email}

CT05: Register a new user unsuccessfully with blank password
    [Tags]    registerUser
    Register a new user    ${FAKER_NAME}    ${FAKER_NAME}@qa.com    ${blank_password} 
    Verify error: ${msg_blank_password}

CT06: Register a new user unsuccessfully with blank name and blank email
    [Tags]    registerUser
    Register a new user    ${blank_name}    ${blank_email}    ${FAKER_PASSWORD} 
    Verify error: ${msg_blank_name}
    Verify error: ${msg_blank_email}

CT07: Register a new user unsuccessfully with blank name and blank password
    [Tags]    registerUser
    Register a new user    ${blank_name}    ${FAKER_NAME}@qa.com    ${blank_password} 
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
    Register a new user    ${FAKER_NAME}    ${blank_email}    ${blank_password} 
    Verify error: ${msg_blank_email}
    Verify error: ${msg_blank_password}