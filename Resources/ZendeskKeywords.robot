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

User navigates to Zendesk.com
    go to  https://${ZENDESK_DOMAIN}.zendesk.com
    Location should be  https://${ZENDESK_DOMAIN}.zendesk.com/access/unauthenticated

User enter account information
    Press Keys  None  ${ZENDESK_USER_EMAIL}
    Press Keys  None  TAB
    Press Keys  None  ${ZENDESK_USER_PASSWORD}
    Press Keys  None  TAB+RETURN

User should be at his Zendesk workspace
    Wait until page contains  Get started
    Location should be  https://${ZENDESK_DOMAIN}.zendesk.com/agent/get-started/your-account/account-overview
