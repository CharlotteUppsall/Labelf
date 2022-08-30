*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py

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