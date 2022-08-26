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

all labels are selectable for training  #User can choose all labels for training
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

user can train a single choice model to the next data point
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
