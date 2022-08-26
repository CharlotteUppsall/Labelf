*** Settings ***
Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
#Suite Setup    user is logged in
#Suite Teardown  End Web Test

*** Keywords ***

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



*** Test Cases ***

User can choose all labels for training
    [Documentation]  When training; when a new label is added, all labels shall still be possible to select
    [Tags]  Training
    Given user is logged in
    And user creates a new model
    And user starts training the model first time
    And user can create single labeling
    When all labels are selectable for training
    Then user can train a single choice model to the next data point




