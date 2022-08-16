*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Log In
    [Documentation]  Test that will insert credentials, log in and go to the start page.
    [Tags]  AG_164
    Login

