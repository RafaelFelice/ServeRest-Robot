*** Settings ***
Documentation    This page has all the useful elements for login.

*** Variables ***
${LOGIN_INPUT_EMAIL}            email
${LOGIN_INPUT_PASSWORD}         password
${LOGIN_BTN_SUBMIT}             //button[@data-testid='entrar']
${LOGIN_LINK_REGISTER}          //a[@data-testid='cadastrar']

${MSG_INVALID_EMAIL}            Email e/ou senha inválidos
${MSG_INVALID_PASSWORD}         Email e/ou senha inválidos
${MSG_BLANK_EMAIL}              Email é obrigatório
${MSG_BLANK_PASSWORD}           Password é obrigatório