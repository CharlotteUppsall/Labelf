*** Variables ***
${ADD_TO_WORKSPACE}  //*[@id="app"]/div[4]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button/div
${OVERVIEW}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${MY_DATASETS(x)}  //*[@id="app"]/div[9]/div[1]/main/div/div/nav[1]/div/div[1]
${OVERVIEW_220516}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[1]
${CONNECT_ADDITIONAL_DATASET_BUTTON_220506}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${DATASET_CONTINUE_BUTTON_220506}  //*[@id="continue-dataset-card"]/div
${CONNECT_220506}  //*[@id="connect-button"]/div

*** Keywords ***
a dataset has been uploaded
    Login
the dataset is connected to a model
    Create Demo Model
    Verify Demo Model Is Created
    Go To Model Overview
    Get Confidence Levels Before Dataset Has Been Added
    Scroll Element Into View  ${CONNECT_ADDITIONAL_DATASET_BUTTON}
    Click Element  ${CONNECT_ADDITIONAL_DATASET_BUTTON}
    Wait Until Page Contains  Pick a dataset to connect
    Connect Additional Dataset
model shall be in state Processing
    Verify Processing Is Active

Run Keyword Until Success
    [Arguments]    ${KW}      @{KWARGS}
    Wait Until Keyword Succeeds    10s      1s     ${KW}      @{KWARGS}


Connect The Dataset To The Model
    Scroll Element Into View  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[7]/div/div/h4
    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
    Wait Until Keyword Succeeds  10s  1s  Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
    Wait Until Page Contains  Datasets available to connect
    Wait Until Page Contains Element  ${DATASET_FOR_TEST}
    Run Keyword Until Success     Click Element      ${DATASET_FOR_TEST}
    Wait Until Page Contains   Please click on the column containing the text you want to classify
    Scroll Element Into View  ${CONNECT_220506}
    Wait Until Element Is Visible  ${CONNECT_220506}
    Run Keyword Until Success     Click Element      ${CONNECT_220506}
    Wait Until Page Contains   Connected Datasets
