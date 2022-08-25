*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Variables ***

${BROWSER}  chrome

*** Test Cases ***

Verify Radio Button Is Shown
    [Documentation]  Verify Radio Button Is Shown When Multiple Choice Is Clicked
    [Tags]  Testcase 7  stagWorkspace
    Given User Is Logged In, Have Changed Workspace And Created A Model
    When User Adds Multiple Choice Label
    Given Multiple Choice Is Provided As Option
    When Multiple Choice Is Selected
    Then Radio Buttons For Created Labels Is Shown