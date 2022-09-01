*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py

*** Keywords ***

user starts training the model first time
     Add labels for model
user can create single labeling
    Choose model type to be Single Choice
Add labels for model
    Wait Until Page Contains Element  ${CHOOSE_MODEL}
    Click Element  ${CHOOSE_MODEL}
    Wait Until Page Contains  It does not look like you have trained the model
    Sleep   300s
    Wait Until Page Contains Element  ${START_TRAINING}
    Click Element    ${START_TRAINING}
   #Sleep  240s
   #Reload Page
   Sleep  5s
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element   ${ADD_LABEL} 
    Click Element     ${ADD_LABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element   ${NEW_LABEL_NAME}
    Input Text  ${NEW_LABEL_NAME}   Katt   
    Wait Until Page Contains Element   ${ADD_ONE_LABEL}
    Click Element   ${ADD_ONE_LABEL}
    Wait Until Page Contains Element  ${NAME_ON_FIRST_LABEL}
    Element Text Should Be  ${NAME_ON_FIRST_LABEL}   KATT
    Wait Until Page Contains Element    ${ADD_SECOND_LABEL}
    Click Element  ${ADD_SECOND_LABEL}
    Wait Until Page Contains Element   ${INPUT_TEXT_LABEL}
    Input Text    ${INPUT_TEXT_LABEL}   Uggla
    Wait Until Page Contains Element    ${ADDED_SECOND_LABEL_DONE}
    #detta element är addlabel efter Uggla
    Click Element   ${ADDED_SECOND_LABEL_DONE}
Choose model type to be Single Choice
    Wait Until Page Contains  Choose model type
    Sleep  1s
    Wait Until Page Contains Element   ${CHOOSE_SINGLE}
    Click Element   ${CHOOSE_SINGLE}
    Wait Until Page Contains  Lets start by giving Labelf 20 samples
    Go To   https://stag.labelf.ai/main/68/models/view

all labels are selectable for training  #User can choose all labels for training
   Wait Until Page Contains  My Models
   Sleep  1s
   Click Element  ${BODY_MODEL}
   Wait Until Page Contains  It does not look like you have trained the model
   Click Element  ${START_TRAINING}
   Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
   Sleep  1s
   Click Element  ${ADD_LABEL}
   Wait Until page Contains  Add a new label
   Input Text  ${FIRST_NAME_LABEL}  Test 1
   Click Element  ${ADD_A_FIRST_NAMED_LABEL}
   Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
   Sleep  2s
   Click Element  ${ADD_A_SECOND_LABEL}
   Wait Until page Contains  Add a new label
   Sleep  1s
   Input Text  ${SECOND_NAME_LABEL}  Test 2
   Click Element  ${ADD_A_SECOND_NAMED_LABEL}
   Sleep  1s
   Click Element  ${SINGLE_CHOICE}
   Wait Until Page Contains Element  ${ADD_A_LABEL}
   Click Element  ${ADD_A_LABEL}
   Wait Until Page Contains Element  ${NAME_ON_THIRD_LABEL}
   Input Text  ${NAME_ON_THIRD_LABEL}  Test 3
   Wait Until Page Contains Element  ${ADD_LABEL_BUTTON}
   Click Element  ${ADD_LABEL_BUTTON}
   Sleep  1s
   Wait Until Page Contains Element  ${LABEL_1}
   Wait Until Page Contains Element  ${LABEL_2}
   Wait Until Page Contains Element  ${LABEL_3}

user can train a single choice model to the next data point
   Wait Until page Contains  Lets start by giving Labelf 20 samples
   Wait Until Page Contains Element  ${DATAPOINT}
   ${text} =  Get Text  ${DATAPOINT}
   Click Element  ${TEST_ONE_LABEL}
   Sleep  2s
   Element Text Should Not Be  ${DATAPOINT}  ${text}
   Wait Until Page Contains Element  ${ESC_BUTTON}
   Click Element  ${ESC_BUTTON}
   Wait Until Page Contains Element  ${MODEL_BUTTON}
   Click Element  ${MODEL_BUTTON}
