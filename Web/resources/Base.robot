*** Settings ***
Documentation    Base has all the basic variables and libraries for all pages.
Library          SeleniumLibrary
Library          FakerLibrary
Resource         pages/login/LoginElements.robot
Resource         pages/login/LoginPage.robot
Resource         pages/home/HomeElements.robot
Resource         pages/registerUser/RegisterUserElements.robot
Resource         pages/registerUser/RegisterUserPage.robot
Resource         Commons.robot
Variables        userData.py

*** Variables ***
${URL_BASE}      https://front.serverest.dev/login
${BROWSER}       chrome

*** Keywords ***
Access page serverest
    Open Browser    ${URL_BASE}    ${BROWSER}
    Maximize Browser Window