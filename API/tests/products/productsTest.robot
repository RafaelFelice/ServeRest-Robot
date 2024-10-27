*** Settings ***
Documentation      This suite has goal to test the product feature from API.
Resource           ../../resources/utils/Base.robot


*** Test Cases ***
CT01: Register a new product successfully
    [Tags]    regression    smoke    
    Create a new product by Api
    Get Token
    Register a new product by Api     ${PATH.products}    ${TOKEN}    ${FAKER_NAME_PRODUCT}    ${FAKER_PRICE_PRODUCT}    ${FAKER_DESCRIPTION_PRODUCT}    ${FAKER_QUANTITY_PRODUCT}
    Should Be Equal As Numbers        ${Response.status_code}                  201
    Should Be Equal As Strings        ${Response.json()['message']}            Cadastro realizado com sucesso

CT02: Register a new product unsuccessfully
    [Tags]    regression    
    Get Token
    Register a new product by Api     ${PATH.products}    ${TOKEN}    ${default_name_product}    ${default_price}    ${default_description}    ${default_quantity}
    Should Be Equal As Numbers        ${Response.status_code}                  400
    Should Be Equal As Strings        ${Response.json()['message']}            Já existe produto com esse nome

CT03: Register a new product without token
    [Tags]    regression     
    Register a new product by Api     ${PATH.products}         ${default_name_product}    ${default_price}    ${default_description}    ${default_quantity}
    Should Be Equal As Numbers        ${Response.status_code}                  401
    Should Be Equal As Strings        ${Response.json()['message']}            Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

CT04: Search a product by id successfully
    [Tags]    regression    smoke    
    Create a new product by Api
    Get Token
    Register a new product by Api     ${PATH.products}    ${TOKEN}    ${FAKER_NAME_PRODUCT}    ${FAKER_PRICE_PRODUCT}    ${FAKER_DESCRIPTION_PRODUCT}    ${FAKER_QUANTITY_PRODUCT}    
    Set Test Variable                 ${productId}    ${response.json()['_id']}
    Get id                            ${PATH.products}    ${productId}
    Should Be Equal As Numbers        ${Response.status_code}                  200
    Should Be Equal As Strings        ${Response.json()['_id']}                ${productId}

CT05: Search a product by id unsuccessfully
    [Tags]    regression    
    Create a new product by Api
    Get Token
    Register a new product by Api     ${PATH.products}    ${FAKER_NAME_PRODUCT}    ${FAKER_PRICE_PRODUCT}    ${FAKER_DESCRIPTION_PRODUCT}    ${FAKER_QUANTITY_PRODUCT}     
    Get id                            ${PATH.products}    ${incorrect_product_id}
    Should Be Equal As Numbers        ${Response.status_code}                  400
    Should Be Equal As Strings        ${Response.json()['message']}            Produto não encontrado

CT06: Search all products successfully
    [Tags]    regression    
    Get Token
    Get id                            ${PATH.products}
    Should Be Equal As Numbers        ${Response.status_code}                  200
    Should Be True                    ${Response.json()['quantidade']}         > 0

CT07: Delete a product successfully
    [Tags]    regression    smoke    
    Create a new product by Api
    Get Token
    Register a new product by Api     ${PATH.products}    ${TOKEN}    ${FAKER_NAME_PRODUCT}    ${FAKER_PRICE_PRODUCT}    ${FAKER_DESCRIPTION_PRODUCT}    ${FAKER_QUANTITY_PRODUCT}    
    Set Test Variable                 ${productId}    ${response.json()['_id']}
    Delete product by id              ${PATH.products}    ${productId}
    Should Be Equal As Numbers        ${Response.status_code}                  200
    Should Be Equal As Strings        ${Response.json()['message']}            Registro excluído com sucesso