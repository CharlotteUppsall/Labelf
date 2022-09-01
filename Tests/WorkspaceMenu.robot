*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/WorkspaceKeywords.robot
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

Verify that each of the workspace settings are clickable
    [Documentation]  Logged in user can select workspace settings
    [Tags]  Workspace
    Given user clicks on the workspace menu
    #And workspace settings are shown
    When user clicks on each of the workspace settings
    Then user is navigated to the correlating page

Verify that each of the workspace menu titles are shown
    [Documentation]  Tests that all of the titles that should be listed in workspace menu are shown for the user
    [Tags]  Workspace
    Given user is on labelf website
    When user clicks on the workspace menu
    Then each of the workspace menu titles are shown
