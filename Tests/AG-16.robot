*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Can Create A Model
    [Documentation]   Test that verifies that a model is created.
    [Tags]  AG_16
    Create Model
User Can Delete Model
    [Documentation]  Test that verifies model is deleted.
    [Tags]  AG_16
    Delete Model
