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
    Click Element  ${ModelID3085NameButtonInWorkspace}
    sleep 20s

User Inputs an example from the first dataset to the test the model
      Input Text  ${InputDescriptionTextField}  known to be rude and unwelcoming
      Click Button  ${SubmitButton}


Confidence levels matches the label of the original datapoint
    #${ElementCount}=  Get Element count  //div[contains(@class,'v-toolbar__content')]
    #log to console  ${ElementCount}


    Log to console  .
    Log to console  ${confidenceRank4}
    Log to console  ---------
    Log to console  ${confidenceRank3}
    Log to console  ---------
    Log to console  ${confidenceRank2}
    Log to console  ---------
    Log to console  ${confidenceRank1}
    Log to console  ---------

    IF  "Negative" in """${confidenceRank1}"""
        Log to console  Negative is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "Positive" in """${confidenceRank1}"""
        Log to console  Positive is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "Neutral" in """${confidenceRank1}"""
        Log to console  Neutral is the label with the highest confidence level
        Log to console  ---------

   ELSE IF  "N/A" in """${confidenceRank1}"""
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
    Go To  ${AppWorkspaceModelView}
    Click Element  ${OverviewPrelabledButton}
    Wait Until Page Contains  Overview

User Inputs Test Sentence From Orginal Dataset into "Test Your Model"
    Input Text  ${InputDescriptionTextField}  They always round up tickets for prizes from the "games". I don't think they'd turn a kid away from getting a little something!
    Click Button  ${SubmitButton}

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