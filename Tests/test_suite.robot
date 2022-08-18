*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Login To Labelf
    [Documentation]  Test for user login to labelf
    [Tags]  Test 1  stagWorkspace  AG-119
    Given Go To  ${stag_login_site}
          Input User Credential
    When Press Login Button
    Then Confirm User Logged In

Create a Model
    [Documentation]  Test that verifies user creation of model on labelf
    [Tags]  Test 2  stagWorkspace  AG-119
    Given User Is Logged In And On An Empty Workspace
    When User Clicks Button "New Model" And To Create A New Model From Scratch
    And Select An Existing Dataset
    And Set A Name And Description For Model
    Then Model Is Created On Workspace
    And Model Description Is Presented In Model Overview

#User Can Create Model
#    [Documentation]  Once workspace is changed; being able to create model
#    [Tags]  Model
#    Create A Model

#User Can Create A Model
#    [Documentation]   Test that verifies that a model is created.
#    [Tags]  AG_16
#    Create Model
