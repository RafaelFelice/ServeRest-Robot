*** Settings ***
Documentation      This suite has goal to test the login feature.
Resource       ../../resources/utils/Base.robot   

*** Test Cases ***
CT01: Login successfully
    [Tags]    regression    smoke
    Login by Api    ${default_email}    ${default_password}
    Should Be Equal As Numbers    ${Response.status_code}              200
    Should Be Equal As Strings    ${Response.json()['message']}        Login realizado com sucesso
    Set Global Variable           ${Auth}    ${response.json()['authorization']}

CT02: Login unsuccessfully with incorrect email
    [Tags]    regression
    Login by Api    ${incorrect_email}    ${default_password}
    Should Be Equal As Numbers    ${Response.status_code}              401
    Should Be Equal As Strings    ${Response.json()['message']}        Email e/ou senha inválidos

CT03: Login unsuccessfully with incorrect password
    [Tags]    regression
    Login by Api    ${default_email}    ${incorrect_password}
    Should Be Equal As Numbers    ${Response.status_code}              401
    Should Be Equal As Strings    ${Response.json()['message']}        Email e/ou senha inválidos

CT04: Login unsuccessfully with incorrect email and incorrect password
    [Tags]    regression
    Login by Api    ${incorrect_email}    ${incorrect_password}
    Should Be Equal As Numbers    ${Response.status_code}              401
    Should Be Equal As Strings    ${Response.json()['message']}        Email e/ou senha inválidos

CT05: Login unsuccessfully with invalid email
    [Tags]    regression
    Login by Api    ${invalid_email}    ${default_password}
    Should Be Equal As Numbers    ${Response.status_code}              400
    Should Be Equal As Strings    ${Response.json()['email']}          email deve ser um email válido

CT06: Login unsuccessfully with blank email
    [Tags]    regression
    Login by Api    ${blank_email}    ${default_password}
    Should Be Equal As Numbers    ${Response.status_code}              400
    Should Be Equal As Strings    ${Response.json()['email']}          email não pode ficar em branco

CT07: Login unsuccessfully with blank password
    [Tags]    regression
    Login by Api    ${default_email}    ${blank_password}
    Should Be Equal As Numbers    ${Response.status_code}              400
    Should Be Equal As Strings    ${Response.json()['password']}       password não pode ficar em branco

CT08: Login unsuccessfully with blank email and blank password
    [Tags]    regression
    Login by Api    ${blank_email}    ${blank_password}
    Should Be Equal As Numbers    ${Response.status_code}              400
    Should Be Equal As Strings    ${Response.json()['email']}          email não pode ficar em branco
    Should Be Equal As Strings    ${Response.json()['password']}       password não pode ficar em branco