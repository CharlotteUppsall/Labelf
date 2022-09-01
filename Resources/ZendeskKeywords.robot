*** Keywords ***

Start WebTest
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument  --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    # Comment away to capture video
    #Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Selenium speed  0.2s
    Set Selenium Timeout  10s
    Set Window Size  1600  900

## Test case 1: Login to Zendesk workspace
User navigates to Zendesk.com
    go to  https://${zendesk_domain}.zendesk.com
    Location should contain  https://${zendesk_domain}.zendesk.com/access/unauthenticated

User enter account information
    Select frame  xpath=//iframe
    Input text  //*[@id="user_email"]  ${zendesk_usesr_email}
    Input Password  //*[@id="user_password"]  ${zendesk_usesr_password}
    Click button  //*[@id="sign-in-submit-button"]
    #Press Keys  None  ${zendesk_usesr_email}
    #Press Keys  None  TAB
    #Press Keys  None  ${zendesk_usesr_password}
    #Press Keys  None  TAB+RETURN

User should be at his Zendesk workspace
    Wait until page contains  Dashboard
    Location should be  https://${zendesk_domain}.zendesk.com/agent/get-started/your-account/account-overview


## Test case 2: Check Labelf app is installed
User is logged in on Zendesk workspace
    Location should contain  https://${zendesk_domain}.zendesk.com/agent/

User looks at screen
    Scroll element into view  //*[@data-app-title="AI Ticket Tagger by Labelf"]

Labelf icon should be visible
    Page should contain element  //*[@data-app-title="AI Ticket Tagger by Labelf"]


## Test case 3: Activate aLabelf model in Zendesk
User Click on labelf Icon
   click element  //*[@data-app-title="AI Ticket Tagger by Labelf"]
   Wait until page contains  AI Ticket Tagger by Labelf

User Choose model and ticket field to update
   ## Line below navigates to list of model choices and chooses model id:3590
    Page should contain  You have no active models yet
    Select Frame  xpath=//iframe
    Select From List By Index  //*[@id="modelSelect"]  2
    Select From List By Index  //*[@id="tagsorfieldsSelect"]  1
    Wait Until Page Contains Element  //*[@id="fieldSelect"]
    Select From List By Index  //*[@id="fieldSelect"]  2

User click on Activate Model on this field
   ## Navigates to 'Activate model'-button and presses it.
    Page Should Contain Element  //*[@id="clickMe"]
    Click Element  //*[@id="clickMe"]

There is an activated model
    Wait Until Page Contains Element  //*[@id="triggers"]/div/span
    Wait Until Page Contains Element  //*[@id="clickMe"]
    Unselect Frame



## Test case 4
User clicks on ticket menu
    Click Element  //*[@data-ember-action="1687"]
    Wait Until Page Contains  Unassigned tickets

User clicks on All unsolved tickets
    Click Element  //*[@data-view-id="6420352720669"]
    Wait Until Page Contains  less than a minute ago

User clicks on ticket
    #Takes the [6]'s numbered element with data-garden-id="tables.cell" which will be the first ticket.
    ${GetTicketElement}=  get webelement  xpath:(//*[@data-garden-id="tables.cell"])[6]
    Click Element  ${GetTicketElement}

Verify that ticket has tag
    Wait Until Page Contains  Delivery


## Test case 5
User Clicks Deactivate model button
    Select Frame  xpath=//iframe
    Wait Until Page Contains Element  //*[@id="clickMe"]
    Click Element  //*[@id="clickMe"]

There is no activated model
    Wait Until Page Contains  You have no active models yet
    Unselect Frame
