*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

All labels are selectable
   Wait Until Page Contains  My Models
   Sleep  1s
   Click Element  ${BODYMODEL}
   Wait Until Page Contains  It does not look like you have trained the model
   Click Element  ${STARTTRAINING}
   Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
   Sleep  1s
   Click Element  ${ADDLABEL}
   Wait Until page Contains  Add a new label
   Input Text  ${FIRSTNAMELABEL}  Test 1
   Click Element  ${ADDAFIRSTNAMEDLABEL}
   Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
   Sleep  2s
   Click Element  ${ADDASECOUNDLABEL}
   Wait Until page Contains  Add a new label
   Sleep  1s
   Input Text  ${SECOUNDNAMELABEL}  Test 2
   Click Element  ${ADDASECOUNDNAMEDLABEL}
   Sleep  1s
   Click Element  ${SINGLECHOISE}
   Wait Until Page Contains Element  ${ADDALABEL}
   Click Element  ${ADDALABEL}
   Wait Until Page Contains Element  ${NAMEONTHIRDLABEL}
   Input Text  ${NAMEONTHIRDLABEL}  Test 3
   Wait Until Page Contains Element  ${ADDLABELBUTTON}
   Click Element  ${ADDLABELBUTTON}
   Sleep  1s
   Wait Until Page Contains Element  ${LABEL1}
   Wait Until Page Contains Element  ${LABEL2}
   Wait Until Page Contains Element  ${LABEL3}

User can train a single choice model to the next data point
   Wait Until page Contains  Lets start by giving Labelf 20 samples
   Wait Until Page Contains Element  ${DATAPOINT}
   ${text} =  Get Text  ${DATAPOINT}
   Click Element  ${TEST1LABEL}
   Sleep  2s
   Element Text Should Not Be  ${DATAPOINT}  ${text}
   Wait Until Page Contains Element  ${ESCBUTTON}
   Click Element  ${ESCBUTTON}
   Wait Until Page Contains Element  ${MODELBUTTON}
   Click Element  ${MODELBUTTON}



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

User can choose all labels for training
    [Documentation]  When training; when a new label is added, all labels shall still be possible to select
    [Tags]  Training
    All labels are selectable

User can train a model
    [Documentation]  Once one label is selected; being able to train it
    [Tags]  Label
    User can train a single choice model to the next data point

User Can Delete Model
    [Documentation]  Once a model is created; being able to delete a model
    [Tags]  Model
    Delete Model

User Can Log out
    [Documentation]  Once user is logged in; being able to log out
    [Tags]  Account
    Log Out User




