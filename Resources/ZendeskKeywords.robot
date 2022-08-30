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
    Press Keys  None  ${zendesk_usesr_email}
    Press Keys  None  TAB
    Press Keys  None  ${zendesk_usesr_password}
    Press Keys  None  TAB+RETURN

User should be at his Zendesk workspace
    Wait until page contains  Get started
    Location should be  https://${zendesk_domain}.zendesk.com/agent/get-started/your-account/account-overview

## Test case 2: Check Labelf app is installed
User is logged in on Zendesk workspace
    Location should be  https://${zendesk_domain}.zendesk.com/agent/get-started/your-account/account-overview

User looks at screen
    Scroll element into view  //*[@data-app-title="AI Ticket Tagger by Labelf"]

Labelf icon should be visible
    Page should contain element  //*[@data-app-title="AI Ticket Tagger by Labelf"]


User clicks on ticket menu
    Click Element  //*[@data-ember-action="1687"]
    Wait Until Page Contains  Unassigned tickets

User clicks on All unsolved tickets
    Click Element  //*[@data-view-id="6420352720669"]
    Sleep  1
    Page Should Contain  less than a minute ago

User clicks on ticket

    #Takes the [6]'s numbered element with data-garden-id="tables.cell" which will be the first ticket.
    ${GetTicketElement}=  get webelement  xpath:(//*[@data-garden-id="tables.cell"])[6]
    Click Element  ${GetTicketElement}

Verify that ticket has tag
    Wait Until Page Contains  Delivery