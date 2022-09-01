*** Settings ***
Resource  ../Resources/keywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot

Library  SeleniumLibrary

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Login To Labelf
    [Documentation]  Test for user login to labelf
    [Tags]  Test 1  stagWorkspace  AG-119
    Given Go To  ${STAG_LOGIN_SITE}
          Input User Credential
    When Press Login Button
    Then Confirm User Logged In
