*** Keywords ***
#Kimchi Login
Login Kimchi
    Input User Credential
    Press Login Button
    Confirm User Logged In
Input User Credential
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${login_email_field}  ${email_kimchi}
    Input Text    ${login_password_field}  ${password_kimchi}
Confirm User Logged In
    Wait Until Page Contains  My Models
Press Login Button
    Click Element  ${LoginButton}
#Setup and Teardown
Start WebTest
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument  --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless  # Comment away to capture video
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome_options}

    Open Browser  about:blank  headlesschrome
    Set Selenium Speed  0.2s
    Set Window Size  1920  1080
    Go To  ${stag_login_site}
    Wait Until Element Is Visible  ${diffuse_cookie_button}
    Click Button  ${diffuse_cookie_button}

End WebTest
    #Verify Workspace Is Empty
    Close All Browsers

End Model Creation Test
    Delete Single Automated Test Model
    Close Browser

User Navigate/Login To App and Navigates To Workspace 387
    Navigate to Workspace 387
    Input User Credential
    Confirm Cookie
    Press Login Button
    Confirm User Logged In
    Wait Until Page Contains  Models | Team Kimchi
    
User Is Logged In And On An Empty Workspace
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (0)

Delete Single Automated Test Model
    User Is Logged In And On An Workspace Containing One Model
    User Opens Single Model Options Dropdown List
    User Clicks Delete Model Option
    Workspace Is Empty

User Is Logged In And On An Workspace Containing One Model
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (1)

User Opens Single Model Options Dropdown List
    Wait Until Page Contains Element  ${SingleModelOptionsButton}
    Click Element  ${SingleModelOptionsButton}

Workspace Is Empty
    Wait Until Page Contains  My Models (0)

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${DeleteOption}
    Click Element  ${DeleteOption}
    Wait Until Page Contains Element  ${DeleteButton}
    Click Button  ${DeleteButton}

