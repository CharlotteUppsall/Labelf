*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Log In
    [Documentation]  Test that will insert credentials, log in and go to the start page.
    [Tags]  AG_16
    Login
User Can Create A Model
    [Documentation]   Test that verifies that a model is created.
    [Tags]  AG_16
    Create Model
User Can Delete Model
    [Documentation]  Test that verifies model is deleted.
    [Tags]  AG_16
    Delete Model