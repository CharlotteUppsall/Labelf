*** Keywords ***

Start WebTest
    ${CHROME_OPTIONS}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${CHROME_OPTIONS}    add_argument  --disable-dev-shm-usage
    Call Method    ${CHROME_OPTIONS}    add_argument    test-type
    Call Method    ${CHROME_OPTIONS}    add_argument    --disable-extensions
    # Comment away to capture video
    #Call Method    ${CHROME_OPTIONS}    add_argument    --headless
    Call Method    ${CHROME_OPTIONS}    add_argument    --disable-gpu
    Call Method    ${CHROME_OPTIONS}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${CHROME_OPTIONS}
    Set Selenium speed  0.2s
    Set Selenium Timeout  10s
    Set Window Size  1600  900

## Test case 1: Login to Zendesk workspace
User navigates to Zendesk.com
    go to  https://${ZENDESK_DOMAIN}.zendesk.com
    Location should contain  https://${ZENDESK_DOMAIN}.zendesk.com/access/unauthenticated

User enter account information
    Select frame  xpath=//iframe
    Input text  //*[@id="user_email"]  ${ZENDESK_USER_EMAIL}
    Input Password  //*[@id="user_password"]  ${ZENDESK_USER_PASSWORD}
    Click button  //*[@id="sign-in-submit-button"]
    #Press Keys  None  ${zendesk_usesr_email}
    #Press Keys  None  TAB
    #Press Keys  None  ${zendesk_usesr_password}
    #Press Keys  None  TAB+RETURN

User should be at his Zendesk workspace
    Wait until page contains  Dashboard
    Location should be  https://${ZENDESK_DOMAIN}.zendesk.com/agent/get-started/your-account/account-overview


## Test case 2: Check that Labelf app is installed
User is logged in on Zendesk workspace
    Location should contain  https://${ZENDESK_DOMAIN}.zendesk.com/agent/

User looks at screen
    Scroll element into view  //*[@data-app-title="AI Ticket Tagger by Labelf"]

Labelf icon should be visible
    Page should contain element  //*[@data-app-title="AI Ticket Tagger by Labelf"]


## Test case 3: Activate a Labelf model in Zendesk
User Click on labelf Icon
   Click element  //*[@data-app-title="AI Ticket Tagger by Labelf"]
   Wait until page contains  AI Ticket Tagger by Labelf

User Choose model and ticket field to update
    Page should contain  You have no active models yet
    Select Frame  xpath=//iframe
    Select From List By Value  //*[@id="modelSelect"]  ${model_name}            #Selects working model "Customer Support Categories model id:3590"
    Select From List By Value  //*[@id="tagsorfieldsSelect"]  ${ticket_option}  #Selects "Update a ticket field"
    Wait Until Page Contains Element  //*[@id="fieldSelect"]
    Select From List By Value  //*[@id="fieldSelect"]  ${ticket_field_id}        #Selects "Support Category", which is a predefined ticket field.

User click on Activate Model on this field
    Page Should Contain Element  //*[@value="Activate Model on this Field"]
    Click Element  //*[@value="Activate Model on this Field"]                              #Click the only button in IFrame

There is an activated model
    Wait Until Page Contains Element  //*[@id="triggers"]/div/span
    Wait Until Page Contains Element  //*[@id="clickMe"]            #New button, old is removed after clicking.
    Unselect Frame                                                  #Need to unselect frame to go back to starting point for next test.



## Test case 4: User navigates to All unsolved tickets and click the newest ticket.
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


## Test case 5: User clicks deactivate on an already activated model
User Clicks Deactivate model button
    Select Frame  xpath=//iframe
    Wait Until Page Contains Element  //*[@id="clickMe"]
    Click Element  //*[@id="clickMe"]

There is no activated model
    Wait Until Page Contains  You have no active models yet
    Unselect Frame
