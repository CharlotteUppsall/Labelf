*** Settings ***

Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py

Suite Setup  Start WebTest
#Suite Teardown  End WebTest

Suite Teardown  End Model Creation Test

*** Variables ***

${BROWSER}  chrome

*** Test Cases ***
User Login To Labelf
    [Documentation]  Testcase for user login to labelf
    [Tags]  TestCase Login
    Given Go To  ${StagLoginSite}
          Input User Credential
          #Confirm Cookie
    When Press Login Button
    Then Confirm User Logged In

Create A Model For Dataset
    [Documentation]  Creates a single model for Costumer service response
    [Tags]  TestCase Create Model
    Given User Is Logged In And On An Empty Workspace
    When User Clicks Button "New Model" And To Create A New Model From Scratch
    And Select Custumer Service Response as Dataset
    And Set A Name And Description For Model
    Then Model Is Created On Workspace

Adds Two Labels To Model
    [Documentation]  Adds Two Labels and Verify That They Show Up
    [Tags]  TestCase add 2 lables
    Given User Is Logged In And On An Workspace Containing One Model
    When User Clicks Button "Overview" And "Start Training" And "Add a label"
    And Input Label Name And Click Add label
    Then Multiple Choice Is Provided As Option

Verify Radio Button Is Shown
    [Documentation]  Verify Radio Button Is Shown When Multiple Choice Is Clicked
    [Tags]  TestCase Verify Radio Button is visible
    Given Multiple Choice Is Provided As Option
    When Multiple Choice Is Selected
    Then Radio Buttons For Created Labels Is Shown

Train dataset and add third label
    [Documentation]  Train Model with MultipleLabels
    [Tags]  Testcase Train Dataset and 3rd label
    Given Radio Buttons For Created Labels Is Shown
    When Model Is Trained with MultipleLables
    And A Third Label Is Added To Model
    Then All Labels Are Possible To Select

