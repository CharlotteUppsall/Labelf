*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py
Library  String

*** Keywords ***

Navigate to Workspace 387
    Go to  https://app.labelf.ai/main/387/models/view

user Navigate To Model Overview App 4
    Wait Until Page Contains  Models
    Click Element  ${MODEL_ID_3085_NAME_BUTTON_IN_WORKSPACE}
    sleep 20s

User Inputs an example from the first dataset to the test the model
      Input Text  ${INPUT_DESCRIPTION_TEXTFIELD}  known to be rude and unwelcoming
      Click Button  ${SUBMIT_BUTTON}

User Inputs New Test Sentence With Multiple Labels into "Test Your Model"
    Input Text  ${INPUT_DESCRIPTION_TEXTFIELD}  The service is bad, but the food is great
    Click Button  ${SUBMIT_BUTTON}

Confidence levels matches the label of the original datapoint
    #${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__content')]
    #log to console  ${ElementCount}

    ${confidence_rank_1}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[14]  #Rank1
    ${confidence_rank_1}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[14]  #Two variables share the same xpath position need to run the code twice to Pick the right one!
    ${confidence_rank_2}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[15]  #Rank2
    ${confidence_rank_3}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[16]  #Rank3
    ${confidence_rank_4}=  get text  xpath:(//div[contains(@class,'v-toolbar__content')])[17]  #Rank4

    Log to console  .
    Log to console  ${confidence_rank_4}
    Log to console  ---------
    Log to console  ${confidence_rank_3}
    Log to console  ---------
    Log to console  ${confidence_rank_2}
    Log to console  ---------
    Log to console  ${confidence_rank_1}
    Log to console  ---------

    IF  "Negative" in """${confidence_rank_1}"""
        Log to console  Negative is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "Positive" in """${confidence_rank_1}"""
        Log to console  Positive is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "Neutral" in """${confidence_rank_1}"""
        Log to console  Neutral is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "N/A" in """${confidence_rank_1}"""
        Log to console  N/A is the label with the highest confidence level
        Log to console  ---------
    ELSE
        Log to console  ERROR DOES NOT MATCH ANY CONFIDENCELEVEL
        FAIL
    END
User Navigate/Login To App and Navigates To Workspace 387
    Navigate to Workspace 387
    Input User Credential App
    Press Login Button
    Confirm User Logged In
    Wait Until Page Contains  Models | Team Kimchi

User Navigate To Model Overview App 1
    Go To  ${APP_WORKSPACE_MODEL_VIEW}
    Click Element  ${OVERVIEW_PRELABLED_BUTTON}
    Wait Until Page Contains  Overview

User Inputs Test Sentence From Orginal Dataset into "Test Your Model"
    Input Text  ${INPUT_DESCRIPTION_TEXTFIELD}   They always round up tickets for prizes from the "games". I don't think they'd turn a kid away from getting a little something!
    Click Button  ${SUBMIT_BUTTON}

User Inputs confidence levels Sentence matches the label of the original datapoint into "Test Your Model"
    Input Text  ${INPUT_DESCRIPTION_TEXTFIELD}  Do not greet you
    Click Button  ${SUBMIT_BUTTON}

Retrive Confidence Level And Verify Confidence Is Higher Than 100% When Sum
    ${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__title body-2')]
    #log to console  ${ElementCount}

    ${SUM} =  set variable  0

    FOR  ${i}  IN RANGE  4  ${ElementCount}+4
        ${confidenceLevel}=  get text  xpath:(//div[contains(@class,'v-toolbar__title body-2')])[${i}]

        ${OnlyNumber}=    Remove String    ${confidenceLevel}    Confidence:
        ${OnlyNumber}=    Remove String    ${OnlyNumber}  %

        ${SUM1} =    Evaluate    int(${SUM}) + int(${OnlyNumber})
        ${SUM} =  Set variable  ${SUM1}
        #log to console  ${OnlyNumber}
    END
    Log to Console  .
    Log to Console  Precentage sum:
    Log to console  ${SUM}
    ${ControlValue100} =  set variable  100

    IF    ${SUM} < ${ControlValue100}
    Log to console  The precentage is below 100
    Fail
    END

Retrive Confidence Level And Verify that Confidence Is Higher Than 50% When Sum
    ${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__title body-2')]
    FOR  ${i}  IN RANGE  4  ${ElementCount}+1
      ${confidenceLevel}=  get text  xpath:(//div[contains(@class,'v-toolbar__title body-2')])[${i}]
      ${OnlyNumber}=    Remove String    ${confidenceLevel}    Confidence:
      ${OnlyNumber}=    Remove String    ${OnlyNumber}  %

    END
    Log to Console  .
    Log to Console  Confidence Level at:
    Log to Console  ${OnlyNumber}

    ${ControlValue50} =  set variable  50

    IF    ${OnlyNumber} < ${ControlValue50}
    Log to console  The precentage is below 50
    Fail
    END