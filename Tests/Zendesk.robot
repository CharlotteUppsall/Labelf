*** Settings ***
Library  SeleniumLibrary
Library  UploadCSV.py
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

Check Labelf app is installed
    [Documentation]  Checks that icon for Labelf app is visible on screen when
    ...     when user is logged in as admin.
    [Tags]  zendesk
    Given User is logged in on Zendesk workspace
    When User looks at screen
    Then Labelf icon should be visible

Activate a Labelf model in Zendesk
    [Documentation]  User Activate labelf model after login to zendeskworkspace.
    [Tags]  zendesk
    Given User is logged in on Zendesk workspace
    When User Click on labelf Icon
    And User Choose model and ticket field to update
    And User click on Activate Model on this field
    Then There is an activated model

Calling function from Python
    [Documentation]  Run script to upload new tickets without tags,
    ...  then look at new ticket and verify a tag has been added.
    [Tags]  zendesk
    # Script needs to have pandas and requests installed.
    # Use "pip install pandas" and "pip install requests" in terminal to install modules.

    # ${value}  PythonScriptUpload
    # For some reason you can't just run script, need to have it set into a variable. Script returns nothing.
    # However it seems if you use Given it will run script. Probably because Given expects something from keyword.
    Given New tickets are added     #This runs the script, uploading tickets from the Synthetic_tickets.csv file
    When User clicks on ticket menu
    And User clicks on All unsolved tickets
    And User clicks on ticket
    Then Verify that ticket has tag

Deactivate model on Zendesk workspace
    [Documentation]  Last test case in suite to make Zendesk workspace clean
    ...     from activated models.
    [Tags]  zendesk
    Given User is logged in on Zendesk workspace
    When User Click on Labelf Icon
    And User Clicks Deactivate model button
    Then There is no activated model

