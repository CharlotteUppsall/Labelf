*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/locators.robot
Resource  ../Resources/variables.robot

#Suite Setup    Begin Web Test
#Suite Teardown  End Web Test


#To test Single Labeling Feature On Labels



*** Variables ***
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${STARTTRAINING}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div
${ADDLABEL}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button/div/span
${NEWLABELNAME}  //*[@id="app"]/div[10]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDONELABEL}  //*[@id="app"]/div[10]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[2]/button/div
${NAMEONFIRSTLABEL}  //*[@id="app"]/div[13]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[1]/div
${ADDSECONDLABEL}  //*[@id="app"]/div[13]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[2]/div/span
${CHOOSESINGLE}  //*[@id="app"]/div[14]/div/div/div[3]/button[1]/div
${INPUTTEXTLABEL}   //*[@id="app"]/div[14]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUTTEXTLABEL2}  //*[@id="app"]/div[14]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDEDSECONDLABELDONE}  //*[@id="app"]/div[14]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[2]/button/div
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div

${ADDONELABEL220824}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button/div
${ADDONELABEL220824-2}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button/div/span

${URL}   //https://stag.labelf.ai/login

${ADDLABELONCEMORE220824}  //*[@id="app"]/div[10]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[2]/button/div






*** Keywords ***

user is logged in
    Start WebTest
    Go To Stag Login Page
    Log in User

user creates a new model
    Select Team Kattuggla As Workspace
    Create A Model

user starts training the model
     Add labels for model

user can create single labeling
    Choose model type to be Single Choice



#Go To Stag Login Page
 #   Go to    https://stag.labelf.ai/login
    #${URL}
    #Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]


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
    #Reload Page
    #Sleep  2s
    Wait Until Page Contains Element    ${ADDONELABEL220824}   #addlabelursp.
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

#Ueser can see all labels



*** Test Cases ***

#User is logged in; have changed workspace and created a model; ready to train a model.
    #[Documentation]  Once logged in; being able to change workspace
    #[Tags]  StartUp
    #Start WebTest
   # Go To Stag Login Page
   # Log in User
   # Select Team Kattuggla As Workspace
   # Create A Model

Logged in user can create single labeling for their newly created model
    Given user is logged in
    And user creates a new model
    When user starts training the model
    Then user can create single labeling
    #user is able to select the single labeling as a model type


End Single Labeling Test   #suite teardown for this test, put this in settings
    Delete Model
    Log Out User