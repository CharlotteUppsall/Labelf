*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***
User Can Swich Workspace
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains  Current Workspace:
    Scroll Element Into View  ${TKU}
    Wait Until Page Contains Element  ${TKU}
    Sleep  1s
    Wait Until Page Contains Element  //*[@id="app"]/div[1]/div/div[2]/div[3]/a/div[1]
    Wait Until Page Contains Element  //*[@id="app"]/div[1]/div/div[2]/div[3]
    Click Element  ${TKU}
    Wait Until Location Is  https://stag.labelf.ai/main/68/models/view
    Sleep  1s
    Wait Until Page Contains Element  //*[@id="app"]/div[1]/div/div[2]/div[3]/a/div[1]
    Click Element  //*[@id="app"]/div[1]/div/div[2]/div[3]/a/div[1]
    Wait Until Location Is  https://stag.labelf.ai/main/66/models/view
    Sleep  1s
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}




*** Variables ***
${TKU}  //*[@id="app"]/div[1]/div/div[2]/div[5]
${MFW1}  //*[@id="app"]/div[1]/div/div[2]/div[4]
${MFW2}  //*[@id="app"]/div[1]/div/div[2]/div[3]
*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

User Can Swich Workspace
    [Documentation]  Once accessing the website; user can switch workspace
    [Tags]  Account
    User Can Swich Workspace


User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User