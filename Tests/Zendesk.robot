*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/ZendeskVariables.robot
Resource  ../Resources/ZendeskKeywords.robot

Suite Setup  Start WebTest
#Suite Teardown  Close All Browsers
*** Keywords ***



*** Test Cases ***


Login to Zendesk workspace
    [Documentation]  User login to zendesk workspace
    [Tags]  zendesk
    Given User navigates to Zendesk.com
     When User enter account information
     Then User should be at his Zendesk workspace