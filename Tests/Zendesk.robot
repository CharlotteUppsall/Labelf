*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/ZendeskVariables.robot
Resource  ../Resources/ZendeskKeywords.robot

Suite Setup  Start WebTest
Suite Teardown  Close All Browsers
*** Keywords ***



*** Test Cases ***


Login to Zendesk workspace
    [Documentation]  User login to zendesk workspace. Uses variables for
    ...     Zendesk domain and user credentials that can be set in resource
    ...     file /PageObjects/ZendeskVariables.robot
    [Tags]  zendesk
    Given User navigates to Zendesk.com
     When User enter account information
     Then User should be at his Zendesk workspace