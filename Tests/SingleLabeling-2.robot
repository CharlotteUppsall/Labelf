*** Settings ***
Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
#Suite Setup    user is logged in
#Suite Teardown  End Web Test


*** Test Cases ***
User can choose all labels for training
    [Documentation]  When training; when a new label is added, all labels shall still be possible to select
    [Tags]  Training
    Given user is logged in
    And user creates a new model
    And user starts training the model first time
    And user can create single labeling
    When all labels are selectable for training
    Then user can train a single choice model to the next data point




