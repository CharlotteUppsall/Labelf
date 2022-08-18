*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Model name field
    Sleep  1s
    Click Element  ${OVERFIEW}
    Wait Until Page Contains Element  ${OVERFIEWBUTTON}
    Click Element  ${OVERFIEWBUTTON}
    Wait Until Page Contains  It does not look like you have trained the model
    Click Element  ${SETTINGS}
    Wait Until Page Contains  Edit model name and description
    Click Element  ${MODELS}
    Wait Until Page Contains  Models | My first workspace

*** Variables ***

${OVERFIEW}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
${OVERFIEWBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${SETTINGS}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
${MODELS}  //*[@id="app"]/div[4]/div[1]/nav/div/a[1]/div/span[1]

*** Test Cases ***

User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  TestJenkins
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Account
    Log in User

User Can Create Model
    [Documentation]  Once workspace is changed; being able to create model
    [Tags]  Model
    Create A Model

User can see edit model name field
    [Documentation]  When the settings button is clicked Then edit model name field shall be shown
    [Tags]  Settings
    Model name field

User Can Delete Model
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User