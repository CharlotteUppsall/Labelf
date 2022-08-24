*** Keywords ***

Start WebTest
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument  --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    #Call Method    ${chrome_options}    add_argument    --headless  # Comment away to capture video
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Selenium speed  0.2s
    Set Window Size  1600  900

User navigates to Zendesk.com
    go to  https://${zendesk_domain}.zendesk.com
    Location should be  https://${zendesk_domain}.zendesk.com/access/unauthenticated

User enter account information
# TODO: Put credentials into variables.
    Press Keys  None  linus.callheim@gu.se
    Press Keys  None  TAB
    Press Keys  None  begs5nyt
    Press Keys  None  TAB+RETURN

User should be at his Zendesk workspace
    Wait until page contains  Get started
    Location should be  https://${zendesk_domain}.zendesk.com/agent/get-started/your-account/account-overview