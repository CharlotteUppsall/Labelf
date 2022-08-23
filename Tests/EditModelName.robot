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
