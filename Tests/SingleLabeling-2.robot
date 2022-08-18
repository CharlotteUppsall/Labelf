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

*** Variables ***

${BODYMODEL}              //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${STARTTRAINING}          //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div
${ADDLABEL}               //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div/span
${FIRSTNAMELABEL}         //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDAFIRSTNAMEDLABEL}    //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${ADDASECOUNDLABEL}       //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${SECOUNDNAMELABEL}       //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDASECOUNDNAMEDLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${SINGLECHOISE}           //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${TEST1LABEL}             //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${DATAPOINT}              //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[1]/div[1]/div/span
${ESCBUTTON}              //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}            //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div/i
${ADDALABEL}              //*[@id="app"]/div[8]/div/div[1]/div[3]/div/a/div/span
${NAMEONTHIRDLABEL}       //*[@id="app"]/div[2]/div/div/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
${ADDLABELBUTTON}         //*[@id="app"]/div[2]/div/div/form/div[3]/button/div
${LABEL1}                 //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${LABEL2}                 //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${LABEL3}                 //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[3]/div

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




