*** Variables ***
${GREY_DATASET_BUTTON_2}  //*[@id="app"]/div[11]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[3]/nav/div/span
${SUBMIT_BUTTON_2}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${TEXT_AREA_2}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
${DATASET_FOR_TEST}  //*[@id="continue-dataset-card"]
${ACCOUNT_CONFIDENCE_LEVEL}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[3]
${PROCESSING}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/span
${CONNECT_ADDITIONAL_DATASET_GREYED_OUT}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span
${DISCONNECT_DATASET}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[2]/div/div/div[1]/div/div/div[2]/span/button
@{CONFIRM_DISCONNECT}  //button[@style= 'background: linear-gradient(135deg, rgb(255, 56, 96), rgb(255, 132, 56));']

*** Keywords ***
Input Label To Trained Model
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
    Run Keyword If  '${status}'=='True'  Click Element   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
    Run Keyword If  '${status}'=='True'  Input Text   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea   i forgot my password and my bird died
    Run Keyword If  '${status}'=='False'  Click Element  ${TEXT_AREA_2}
    Run Keyword If  '${status}'=='False'  Input Text  ${TEXT_AREA_2}  i forgot my password and my bird died
    ${status}=  Run Keyword And Return Status  Click Button   ${submit_knapp}
    Run Keyword If  '${status}'=='False'  Click Button   ${SUBMIT_BUTTON_2}

Get Confidence Levels Before Dataset Has Been Added
    Wait Until Page Contains  Model is online
    Input Label To Trained Model
    Wait Until Page Contains Element  ${ACCOUNT_CONFIDENCE_LEVEL}
    ${account_confidence_level_as_string}  Get Text  ${ACCOUNT_CONFIDENCE_LEVEL}
    ${account_confidence_level_before_dataset_is_connected_as_int}  remove_text  ${account_confidence_level_as_string}
    Set Global Variable  ${account_confidence_level_before_dataset_is_connected_as_int}

Get Confidence Levels After Dataset Has Been Added
    Wait Until Page Contains  Model is online
    Input Label To Trained Model
    Wait Until Page Contains Element  ${ACCOUNT_CONFIDENCE_LEVEL}
    ${account_confidence_level_as_string}  Get Text  ${ACCOUNT_CONFIDENCE_LEVEL}
    ${account_confidence_level_after_dataset_is_connected_as_int}  remove_text  ${account_confidence_level_as_string}
    Set Global Variable  ${account_confidence_level_after_dataset_is_connected_as_int}

Compare Confidence Levels Before Dataset Has Been Disconnected
    Should Be True  '${account_confidence_level_before_dataset_is_connected_as_int}'<'${account_confidence_level_after_dataset_is_connected_as_int}'

Compare Confidence Levels After Dataset Has Been Disconnected
    Should Be True  '${account_confidence_level_before_dataset_is_connected_as_int}'=='${account_confidence_level_after_dataset_is_connected_as_int}'

Disconnect Dataset
    Wait Until Element Is Visible  ${DISCONNECT_DATASET}
    Scroll Element Into View  ${DISCONNECT_DATASET}
    Wait Until Keyword Succeeds  10s  1s  Click Element  ${DISCONNECT_DATASET}
    Wait Until Keyword Succeeds  10s  1s  Click Element  @{CONFIRM_DISCONNECT}
Verify Processing Is Inactive
    FOR  ${i}  IN RANGE  0  99  1
    Reload Page
    Wait Until Page Contains  Model is online
    ${status}=  Run Keyword And Return Status  Page Should Not Contain Element  ${GREY_DATASET_BUTTON_2}
    Exit For Loop If  '${status}'=='True'
    Sleep  10s
    END

Verify Processing Is Active
    Reload Page
    Page Should Contain Element  ${GREY_DATASET_BUTTON_2}

That A Dataset With Labels Has Been Connected
    Verify Processing Is Inactive
    Get Confidence Levels After Dataset Has Been Added
The Dataset Is Disconnected
    Disconnect Dataset
Model Shall Not Be In State Processing
    Verify Processing Is Inactive
That A Dataset Has Been Connected And Disconnected Again
    Reload Page
The Model Processing Is Restarted
    Reload Page
The Confidence Levels For An Example Shall Be As Before The Dataset Operation
    Get Confidence Levels After Dataset Has Been Added
    Compare Confidence Levels After Dataset Has Been Disconnected
