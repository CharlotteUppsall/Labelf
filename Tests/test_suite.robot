*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
#User Login To Labelf
#    [Documentation]  Test for user login to labelf
#    [Tags]  Test 1  stagWorkspace  AG-119
#    Given Go To  ${stag_login_site}
#          Input User Credential
#    When Press Login Button
#    Then Confirm User Logged In

Create a Model
    [Documentation]  Test that verifies user creation of model on labelf
    [Tags]  Test 2  stagWorkspace  AG-184
    Given User Is Logged In And On An Empty Workspace
    When User Clicks Button "New Model" And To Create A New Model From Scratch
    And Select An Existing Dataset
    And Set A Name And Description For Model
    Then Model Is Created On Workspace
    And Model Description Is Presented In Model Overview

Delete Single Model
    [Documentation]  Deletes single model, only to be used on workspace with only 1 model.
    [Tags]  Test 3  stagWorkspace  AG-184
    Given User Is Logged In And On An Workspace Containing One Model
    When User Opens Single Model Options Dropdown List
    And User Clicks Delete Model Option
    Then Workspace Is Empty

#User is logged in; have changed workspace and created a model; ready to train a model.
#    [Documentation]  Once logged in; being able to change workspace
#    [Tags]  StartUp
#    Go To Web Page
#    Log in User
#    Select Team Kattuggla As Workspace
#    Create A Model
