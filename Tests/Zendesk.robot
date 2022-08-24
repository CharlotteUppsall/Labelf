*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/ZendeskVariables.robot
Resource  ../Resources/ZendeskKeywords.robot

Suite Setup  Start WebTest
Suite Teardown  Close All Browsers
*** Keywords ***



*** Test Cases ***


Login to Zendesk workspace
    [Documentation]  TODO
    [Tags]  zendesk
    Given User navigates to Zendesk.com
  #  when User enter account information
   # And  User press Login Button
    #then  User should be at his Zendesk workspace