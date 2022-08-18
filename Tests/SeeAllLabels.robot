*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

User can see all labels
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    Wait Until Page Contains  It does not look like you have trained the model
    Wait Until Page Contains Element  ${STARTTRAINING}
    Click Element  ${STARTTRAINING}
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element  ${ADDLABEL}
    Click Element  ${ADDLABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element  ${NEWLABELNAME}
    Input Text  ${NEWLABELNAME}  Katt
    Wait Until Page Contains Element  ${ADDONELABEL}
    Click Element  ${ADDONELABEL}
    Wait Until Page Contains Element  ${NAMEONFIRSTLABEL}
    Element Text Should Be  ${NAMEONFIRSTLABEL}  KATT
    Wait Until Page Contains Element  ${ADDSEKUNDLABEL}
    Click Element  ${ADDSEKUNDLABEL}
    Wait Until Page Contains Element  ${INPUTTEXTLABEL}
    Input Text  ${INPUTTEXTLABEL2}  Uggla
    Wait Until Page Contains Element  ${ADDEDSECONDLABELDONE}
    #detta element är addlabel efter Uggla
    Click Element  ${ADDEDSECONDLABELDONE}
    Wait Until Page Contains  Choose model type
    Sleep  1s
    Wait Until Page Contains Element  ${CHOOSESINGLE}
    Click Element  ${CHOOSESINGLE}
    Wait Until Page Contains  Lets start by giving Labelf 20 samples
    Wait Until Page Contains Element  ${KATTLABEL}
    Sleep  1s
    Click Element  ${KATTLABEL}
    Wait Until Page Contains  Lets start by giving Labelf 19 samples
    Wait Until Page Contains Element  ${UGGLALABEL}
    Sleep  1s
    Click Element  ${UGGLALABEL}
    Wait Until Page Contains  Lets start by giving Labelf 18 samples
    Wait Until Page Contains Element  ${KATTLABEL}
    Sleep  1s
    Click Element  ${KATTLABEL}
    Wait Until Page Contains  Lets start by giving Labelf 17 samples
    Wait Until Page Contains Element  ${UGGLALABEL}
    Sleep  1s
    Click Element  ${UGGLALABEL}
    Wait Until Page Contains  Lets start by giving Labelf 16 samples
    Wait Until Page Contains Element  ${KATTLABEL}
    Sleep  1s
    Click Element  ${KATTLABEL}
    Wait Until Page Contains  Only 15 more to go!
    Wait Until Page Contains Element  ${XBUTTON}
    Sleep  1s
    Click Element  ${XBUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${MODELBUTTON}
    Click Element  ${MODELBUTTON}
    Wait Until Page Contains Element  ${CHOOSEMODEL}




*** Variables ***

${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${ADDLABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${NEWLABELNAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDONELABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${NAMEONFIRSTLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${ADDSEKUNDLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${CHOOSESINGLE}  //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${INPUTTEXTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUTTEXTLABEL2}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDEDSECONDLABELDONE}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div
${KATTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${UGGLALABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div

*** Test Cases ***

User is logged in; have changed workspace and created a model; ready to train a model.
    [Documentation]  Once logged in; being able to change workspace
    [Tags]  StartUp
    Go To Web Page
    Log in User
    Select Team Kattuggla As Workspace
    Create A Model

User can create single labeleing
    [Documentation]  Once created model; being able to chose single labeling when training
    [Tags]  Training
    User can see all labels

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User