*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Log in User2
    Input Text  ${MAIL}   jakob.nilsson@iths.se
    Input Text  ${PASSWORD}  44321jJa
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!

Select Myworkspace As Workspace
    Sleep  1s
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains  Current Workspace:
    Scroll Element Into View  ${TEAMKATTUGGLAU}
    Wait Until Location Is  https://stag.labelf.ai/main/66/models/view
    Wait Until Page Contains  My first workspace
    Click Element  ${CLICKAWAY}


Ueser Can Change Model Name
    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]
    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]
    Wait Until Page Contains  Edit model name and description
    Click Element  //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
    Input Text  //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[2]/div/div/div[1]/div/div/div[1]/div/input  hej
    Wait Until Page Contains Element  //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[3]/button
    Click Element  //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[3]/button
    Wait Until Page Contains Element  //*[@id="app"]/div[4]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
    Click Element  //*[@id="app"]/div[4]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
    Wait Until Page Contains  Customer support data modelhej
    Wait Until Page Contains Element  ${MODELSBUTTON}
    Click Element  ${MODELSBUTTON}

*** Variables ***

${MODELSBUTTON}  //*[@id="app"]/div[7]/div[1]/nav/div/a[1]/div
${TEAMKATTUGGLAU}  //*[@id="app"]/div[1]/div/div[2]/div[5]/a/div[1]
${CLICKAWAY}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button


*** Test Cases ***
User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User2

User Can Change Workspace
    [Documentation]  Once user is logged in; being able to change workspace
    [Tags]  Workspace
    Select Myworkspace As Workspace

User Can Create Model
    [Documentation]  Once workspace is changed; being able to create model
    [Tags]  Model
    Create A Model

User Can Change Model Name And Confirm Change
    [Documentation]  Once model is created; Being able to change model name
    [Tags]  Model
    Ueser Can Change Model Name

User Can Delete Model
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User