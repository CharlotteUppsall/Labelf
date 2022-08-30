*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/ZendeskVariables.robot
Resource  ../Resources/ZendeskKeywords.robot

Suite Setup  Start WebTest
#Suite Teardown  Close All Browsers
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

Check Labelf app is installed
    [Documentation]  Checks that icon for Labelf app is visible on screen when
    ...     when user is logged in as admin.
    [Tags]  zendesk
    Given User is logged in on Zendesk workspace
    When User looks at screen
    Then Labelf icon should be visible

Activate aLabelf model in Zendesk
   [Documentation]  User Activate labelf model after login to zendeskworkspace.
    [Tags]  zendesk
    Given User is logged in on Zendesk workspace
    When User Click on labelf Icon
    And User Choose model and ticket field to update
    And User click on Activate Model on this field
    ##  Then There is an activated model  ##Can't find a way to verify this here.
