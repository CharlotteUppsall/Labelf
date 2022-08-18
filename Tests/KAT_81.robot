*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User4

User Can Change Workspace
    [Documentation]  Once user is logged in; being able to change workspace
    [Tags]  Workspace
    Select MyWorkspace As Workspace

User Can Create Model
    [Documentation]  Once workspace is changed; being able to create model
    [Tags]  Model
    Create A Model

User Can Change A Created Model Name And Show The Setting Page
    [Documentation]  Once a modle is created; being able to change the model name and then show the setting page
    [Tags]  Model Name
    Change A Created Model Name And Show The Setting Page

User Can Delete Model
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User

*** Keywords ***
Log in User4
    Input Text  ${MAIL}   zheng.lin@iths.se
    Input Text  ${PASSWORD}  lz1234567
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!

Select MyWorkspace As Workspace
    Sleep  1s
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains  Current Workspace:
    Scroll Element Into View    //*[@id="app"]/div[3]/div/div[2]/div[6]/a/div[1]/div
    Click Element  //*[@id="app"]/div[3]/div/div[2]/div[3]/a/div[1]/div
    Wait Until Location Is  https://stag.labelf.ai/main/61/models/view
    Wait Until Page Contains  My first workspace
    Click Element  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button

Change A Created Model Name And Show The Setting Page
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element    ${OVERVIEW}
    Click Element   ${OVERVIEW}
    Sleep   2s
    Wait Until Page Contains Element    ${SETTINGBUTTON}
    Click Element   ${SETTINGBUTTON}
    Wait Until Page Contains    Model settings
    Wait Until Page Contains    Edit model name and description
    Click Element   ${INPUTMODELNAME}
    Sleep  2s
    Input Text      ${INPUTMODELNAME}  _newname
    Click Element   ${SAVEBUTTON}
    Wait Until Page Contains    Model settings
    Click Element   ${MODELSBUTTON}

*** Variables ***

${OVERVIEW}     //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
${SETTINGBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
${INPUTMODELNAME}  //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
${SAVEBUTTON}    //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[3]/button/div/i
${MODELSBUTTON}  //*[@id="app"]/div[4]/div[1]/nav/div/a[1]/div/span[1]
