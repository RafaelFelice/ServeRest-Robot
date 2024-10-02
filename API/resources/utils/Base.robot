*** Settings ***
Documentation    Base has all the basic variables and libraries for all requests.
Library          RequestsLibrary
Resource         Commons.robot
Variables        ../../Data/UserDataApi.py

*** Variables ***
${URL_BASE_API}      https://serverest.dev
&{PATH}              login=/login    user=/user