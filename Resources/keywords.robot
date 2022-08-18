*** Settings ***
Resource  variables.robot
Resource  locators.robot

*** Keywords ***
Start WebTest
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument  --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless  # Comment away to capture video
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome_options}

    Open Browser  about:blank  chrome
    Set Selenium Speed  0.2s
    Set Window Size  1920  1080
    Go To  ${stag_login_site}
    Wait Until Element Is Visible  ${diffuse_cookie_button}
    Click Button  ${diffuse_cookie_button}

End WebTest
    #Verify Workspace Is Empty
    Close All Browsers

#Verify Workspace Is Empty
#    FOR  ${i}  IN RANGE  0  5  1
#    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${my_models}
#    Run Keyword If  '${status}'=='False'  Go To  https://app.labelf.ai/main/375/models/view
#    ${status}=  Run Keyword And Return Status  Verify Model Is Deleted
#    Run Keyword If  '${status}'=='False'  Delete Model
#    Exit For Loop If  '${status}'=='True'
#    END

#Team Agile Peacock Login Keywords
Login
    Enter Account Information
    Press Login Button
    Verify Login
    #Verify Workspace Is Empty
Enter Account Information
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e_mail_agile_peacock}
    Input Text  //*[@id="password"]  ${password_agile_peacock}
    Wait Until Page Contains  Labelf
Press Login Button
    Click Element  ${LoginButton}
Verify Login
    Wait Until Page Contains  Models | Agile Peacock

#Team Kimchi Login Keywords
Input User Credential
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${login_email_field}  ${email_kimchi}
    Input Text    ${login_password_field}  ${password_kimchi}
Confirm Cookie
    Sleep  0.2
    Click Button  ${diffuse_cookie_button}
Confirm User Logged In
    Wait Until Page Contains  My Models




