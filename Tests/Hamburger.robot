*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Show All Workspaces
    Wait Until Page Contains Element  //*[@id="hamburger-menu-button"]
    Click Element  //*[@id="hamburger-menu-button"]
    Wait Until Page Contains Element  ${MAINMENULIST}
    Scroll Element Into View  ${TEAMKATTUGGLA}
    Wait Until Page Contains Element  ${TEAMKATTUGGLA}
    Wait Until Page Contains Element  ${MYFIRSTWORKSPACE2}
    Wait Until Page Contains Element  ${MYFIRSTWORKSPACE}
    Wait Until Page Contains Element  ${CREATEWORKSPACE}
    Click Element  //*[@id="hamburger-menu-button"]

*** Variables ***
${TEAMKATTUGGLA}  //*[@id="app"]/div[1]/div/div[2]/div[5]
${MYFIRSTWORKSPACE2}  //*[@id="app"]/div[1]/div/div[2]/div[4]
${MYFIRSTWORKSPACE}  //*[@id="app"]/div[1]/div/div[2]/div[3]
${CREATEWORKSPACE}  //*[@id="app"]/div[1]/div/div[2]/div[2]

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

Acces too all workspaces
    [Documentation]  User has access to multiple workspaces
    [Tags]  Main Menu
    Show All Workspaces

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User