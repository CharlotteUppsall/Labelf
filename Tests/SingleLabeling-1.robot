*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/SingleLabelingKeywords.robot
#Suite Setup    Begin Web Test
#Suite Teardown  End Web Test

#To test Single Labeling Feature On Labels

*** Test Cases ***
Logged in user can create single labeling for their newly created model
    Given user is logged in
    And user creates a new model
    When user starts training the model
    Then user can create single labeling  #user is able to select the single labeling as a model type


End Single Labeling Test   #suite teardown for this test, put this in settings
    Delete Model
    Log Out User