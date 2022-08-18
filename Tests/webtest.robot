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
    Log in User

User Can Change Workspace
    [Documentation]  Once user is logged in; being able to change workspace
    [Tags]  Workspace
    Select Team Kattuggla As Workspace

User Can Create Model
    [Documentation]  Once workspace is changed; being able to create model
    [Tags]  Model
    Create A Model

User Can Delete Model
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User








