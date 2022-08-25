*** Keywords ***
user is logged in
    Start WebTest
#    Go To Stag Login Page
    Log in User
user creates a new model
    Select Team Kattuggla As Workspace
    Create A Model
user starts training the model
     Add labels for model
user can create single labeling
    Choose model type to be Single Choice
Add labels for model
    Wait Until Page Contains Element  ${CHOOSEMODEL}
    Click Element  ${CHOOSEMODEL}
    Wait Until Page Contains  It does not look like you have trained the model
    Sleep  5s
    Wait Until Page Contains Element  ${STARTTRAINING}
    Click Element    ${STARTTRAINING}
    Sleep  240s
    Reload Page
    Sleep  7s
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element    ${ADDONELABEL220824}
    Click Element  ${ADDLABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element  ${NEWLABELNAME}
    Input Text  ${NEWLABELNAME}  Katt
    Wait Until Page Contains Element     ${ADDONELABEL}
    Click Element   ${ADDONELABEL}
    Wait Until Page Contains Element  ${NAMEONFIRSTLABEL}
    Element Text Should Be  ${NAMEONFIRSTLABEL}   KATT
    Wait Until Page Contains Element    ${ADDSECONDLABEL}
    Click Element  ${ADDSECONDLABEL}
    Wait Until Page Contains Element   ${INPUTTEXTLABEL}
    Input Text    ${INPUTTEXTLABEL2}   Uggla
    Wait Until Page Contains Element    ${ADDEDSECONDLABELDONE}
    #detta element är addlabel efter Uggla
    Click Element   ${ADDEDSECONDLABELDONE}

Choose model type to be Single Choice
    Wait Until Page Contains  Choose model type
    Sleep  1s
    Wait Until Page Contains Element   ${CHOOSESINGLE}
    Click Element   ${CHOOSESINGLE}
    Wait Until Page Contains  Lets start by giving Labelf 20 samples
    Go To   https://stag.labelf.ai/main/68/models/view
