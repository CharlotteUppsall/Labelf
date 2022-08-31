*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
#Suite Setup    Begin Web Test
#Suite Teardown  End Web Test



*** Test Cases ***
Logged in user can choose between multiple worspaces to work in 
    Given user is logged in
    And the user navigates to another random page 
    When the user clicks on the workspace menu
    Then the user can select which workspace to navigate to 
