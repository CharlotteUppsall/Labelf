*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py

*** Keywords ***
user is logged in
    Start WebTest
    Log in User
user creates a new model
    Select Team Kattuggla As Workspace
    Create A Model
user starts training the model first time
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
    Sleep  180s
    Reload Page
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element   //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button/div  #${ADDLABEL}
    Click Element  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button/div   #${ADDLABEL}
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
