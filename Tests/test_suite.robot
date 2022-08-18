*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Login To Labelf
    [Documentation]  Testcase for user login to labelf
    [Tags]  Testcase 1  stagWorkspace  AG-119
    Given Go To  ${stag_login_site}
          Input User Credential
    When Press Login Button
    Then Confirm User Logged In

