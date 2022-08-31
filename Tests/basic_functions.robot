*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/all_resources.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest
*** Test Cases ***
User Log In
    [Documentation]  Test that will insert credentials, log in and go to the start page.
    [Tags]  basic_functions
    Login
Verify Workspace Is Ready For Testing
    [Documentation]  Test will check if workspace is empty and ready for Testing
    [Tags]  basic_functions
    Verify Workspace Is Empty
User Can Create A Model
    [Documentation]  Test will create a model based on a existing Dataset
    [Tags]  basic_functions
    Create Model
User Can Delete A Model
    [Documentation]  Test will delete model from previous step
    [Tags]  basic_functions
    Delete Model
User Can Confirm That There Is An Updated Sequence To Include A Step To Select Column
    [Documentation]  Confirm setup steps are updated to include a step to select column
    [Tags]  basic_functions
    Given The User Is Logged In
    And The User Is Creating A Model
    When The "Train Directly On Labels From Existing Column" Slider Button Is Pressed
    Then An Additional Creation Step Should Appear
User Can Confirm Change of Text For Step 3 When "Train Directly[...]" Is Disabled
     [Documentation]  When slider "Train directly on labels from an existing column” is disabled step 3 is changed to: Name your model
     [Tags]   basic_functions
     Given The "Train Directly On Labels From Existing Column" Slider Button Has Been Pressed
     When The "Train Directly On Labels From Existing Column" Slider Button Is Pressed
     Then A Creation Step Should Disappear
Overview of labels are displayed
    [Documentation]  Test will verify that labels from chosen dataset is present after creating model
    [Tags]  basic_functions
    Given The User Has Created A Model With Existing Labels
    When The User Is On The Overview Page
    Then All Of The Labels From The Dataset Should Be Displayed
User Can Select Column Containing The Labels
    [Documentation]  Verifies that a user can select a column containing labels
    [Tags]  basic_functions
    Given A Dataset With Existing Labels Has Been Selected
    And "Train Directly On Labels From An Existing Column" Has Been Enabled
    When The User Clicks Continue
    Then It Shall Be Possible To Select A Column Which Contains The Labels

