*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/ZendeskVariables.robot
Suite Setup  Start WebTest
Suite Teardown  Close All Browsers
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

    #Open Browser  about:blank  chrome
    #Set Selenium Speed  0.2s
    Set Window Size  1600  900


*** Test Cases ***

Navigate to Zendesk workspace
    [Documentation]  First test
    [Tags]  zendesk
    go to  https://${zendesk_domain}.zendesk.com
    Location should be  https://${zendesk_domain}.zendesk.com/access/unauthenticated