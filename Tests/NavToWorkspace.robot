*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/workspaceKeywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
#Suite Setup    Begin Web Test
Suite Teardown  End WebTest



*** Test Cases ***

Select A Workspace
    [Documentation]  Logged in user can choose between multiple workspaces to work in
    [Tags]  Workspace
    Given user is logged in
    And user navigates to another random page
    When user clicks on the workspace menu
    Then user can select which workspace to navigate to

