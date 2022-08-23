*** Settings ***
Documentation  Testing labelf
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Keywords ***

Choose Model To Add Label
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
    Wait Until Page Contains Element  ${XBUTTON}
    Click Element  ${XBUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${MODELBUTTON}
    Click Element  ${MODELBUTTON}
    Wait Until Page Contains Element  ${CHOOSEMODEL}

Ueser can see all labels



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
    Choose Model To Add Label

User delete model and then logging out
    [Documentation]  Once a model is created; being able to delete a model and then log out
    [Tags]  Model
    Delete Model
    Log Out User






