
*** Settings ***

Documentation  Testsuite Login
Resource  ../Resources/modelKeyword.robot
Resource  ../Resources/OrignalStateKeywords.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/VerificationKeyword.robot
Library  SeleniumLibrary


Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Login To Labelf
    [Documentation]  Test for user login to labelf
    [Tags]  Test 1  stagWorkspace  AG-119
    Given Go To  ${stag_login_site}
          Input User Credential
    When Press Login Button
    Then Confirm User Logged In
#
#User Navigate To Workspace
#    [Documentation]  Testcase for user navigate to Workspace
#    [Tags]  Testcase 2  stagWorkspace
#    Given Confirm User Logged In
#    When Open Top Burger Drop Down Menu
#    Then Navigate To Workspace 60
#
#Delete Single Model
#    [Documentation]  Deletes single model, only to be used on workspace with only 1 model.
#    [Tags]  Testcase 4  stagWorkspace
#    Given User Is Logged In And On An Workspace Containing One Model
#    When User Opens Single Model Options Dropdown List
#    And User Clicks Delete Model Option
#    Then Workspace Is Empty
#
#






