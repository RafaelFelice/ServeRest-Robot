*** Settings ***
Documentation    This page has all the useful keywords for list products.
Resource         ../../Base.robot

*** Keywords ***
Check the product in the list
    [Arguments]           ${name_product}
    FOR    ${name_product}    IN    @{PRODUCT_LIST}
        Element Should Be Visible    ${name_product}
        
    END