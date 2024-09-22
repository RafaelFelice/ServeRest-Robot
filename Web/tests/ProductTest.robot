*** Settings ***
Documentation      This suite has goal to test the product feature.
Resource           ../resources/Base.robot
Test Setup         run keywords 
...                Access page serverest
...                Register product
Test Teardown     Close Browser

*** Test Cases ***
# CT01: Login successfully
#     [Tags]    product    regression
#     Login    ${default_email}    ${default_password}
#     Register a new product    
#     ...    ${FAKER_NAME_PRODUCT}    ${FAKER_PRICE_PRODUCT}    
#     ...    ${FAKER_DESCRIPTION_PRODUCT}    ${FAKER_QUANTITY_PRODUCT}
#     Check the product in the list        ${FAKER_NAME_PRODUCT}