*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Can Create Single Labeleing
    [Documentation]  Once a model is created; user is able to chose single labeling when training
    [Tags]  Test 4  stagWorkspace  AG-200
    Given User Is Logged In, Have Changed Workspace And Created A Model
    When User Adds Single Choice Labels
    Then User Can See All Labels