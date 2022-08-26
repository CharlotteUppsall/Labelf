*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot

*** Test Cases ***
User Login To Labelf
    [Documentation]  Test for user login to labelf
    [Tags]  Test 1  stagWorkspace  AG-119
    Given Go To  ${stag_login_site}
          Input User Credential
    When Press Login Button
    Then Confirm User Logged In
