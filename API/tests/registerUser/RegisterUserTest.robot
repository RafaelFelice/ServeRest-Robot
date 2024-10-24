*** Settings ***
Documentation      This suite has goal to test the register user feature from API.
Resource       ../../resources/utils/Base.robot   

*** Test Cases ***
CT01: Register a new user successfully
    [Tags]    regression    smoke
    Create a new user
    Register a new user by Api    ${FAKER_NAME_USER}    ${FAKER_NAME_USER}@testqa.com    ${FAKER_PASSWORD_USER}
    Should Be Equal As Numbers    ${Response.status_code}              201
    Should Be Equal As Strings    ${Response.json()['message']}        Cadastro realizado com sucesso
    Set Test Variable             ${UserId}    ${response.json()['_id']}

CT02: Register a new user unsuccessfully
    [Tags]    regression 
    Register a new user by Api    ${default_name}    ${default_email}    ${default_password}
    Should Be Equal As Numbers    ${Response.status_code}              400
    Should Be Equal As Strings    ${Response.json()['message']}        Este email já está sendo usado

CT03: Search an user by id successfully
    [Tags]    regression    smoke
    Create a new user
    Register a new user by Api    ${FAKER_NAME_USER}    ${FAKER_NAME_USER}@testqa.com    ${FAKER_PASSWORD_USER}
    Set Test Variable             ${UserId}    ${response.json()['_id']}
    Get user by id                ${UserId}
    Should Be Equal As Numbers    ${Response.status_code}              200
    Should Be Equal As Strings    ${Response.json()['_id']}            ${UserId}

CT04: Search an user by id unsuccessfully
    [Tags]    regression
    Get user by id                ${incorrect_user_id}
    Should Be Equal As Numbers    ${Response.status_code}              400
    Should Be Equal As Strings    ${Response.json()['message']}        Usuário não encontrado

CT05: Search all user successfully
    [Tags]    regression
    Get user by id
    Should Be Equal As Numbers    ${Response.status_code}              200
    Should Be True                ${Response.json()['quantidade']}     > 0

CT06: Change a specific user successfully
    [Tags]    regression
    Create a new user
    Register a new user by Api    ${FAKER_NAME_USER}    ${FAKER_NAME_USER}@qa.com    ${FAKER_PASSWORD_USER}
    Set Test Variable             ${UserId}    ${response.json()['_id']}
    Change a new user by Api      ${UserId}    ${other_name}    ${other_email}    ${other_password}
    Should Be Equal As Numbers    ${Response.status_code}              200
    Should Be Equal As Strings    ${Response.json()['message']}        Registro alterado com sucesso
    Delete user by id             ${UserId}

CT07: Delete an user successfully
    [Tags]    regression    smoke
    Create a new user
    Register a new user by Api    ${FAKER_NAME_USER}    ${FAKER_NAME_USER}@testqa.com    ${FAKER_PASSWORD_USER}
    Set Test Variable             ${UserId}    ${response.json()['_id']}
    Delete user by id             ${UserId}
    Should Be Equal As Numbers    ${Response.status_code}              200
    Should Be Equal As Strings    ${Response.json()['message']}        Registro excluído com sucesso