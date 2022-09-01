*** Variables ***
${grey_dataset_button_2}  //*[@id="app"]/div[11]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[3]/nav/div/span
${submit_button_2}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${text_area_2}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
${dataset_for_test}  //*[@id="continue-dataset-card"]
${account_confidence_level}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[3]
${processing}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/span
${connect_additional_dataset_greyed_out}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span
${disconnect-dataset}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[2]/div/div/div[1]/div/div/div[2]/span/button
@{confirm_disconnect}  //button[@style= 'background: linear-gradient(135deg, rgb(255, 56, 96), rgb(255, 132, 56));']

*** Keywords ***
Input Label To Trained Model
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
    Run Keyword If  '${status}'=='True'  Click Element   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
    Run Keyword If  '${status}'=='True'  Input Text   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea   i forgot my password and my bird died
    Run Keyword If  '${status}'=='False'  Click Element  ${text_area_2}
    Run Keyword If  '${status}'=='False'  Input Text  ${text_area_2}  i forgot my password and my bird died
    ${status}=  Run Keyword And Return Status  Click Button   ${submit_knapp}
    Run Keyword If  '${status}'=='False'  Click Button   ${submit_button_2}

Get Confidence Levels Before Dataset Has Been Added
    Wait Until Page Contains  Model is online
    Input Label To Trained Model
    Wait Until Page Contains Element  ${account_confidence_level}
    ${account_confidence_level_as_string}  Get Text  ${account_confidence_level}
    ${account_confidence_level_before_dataset_is_connected_as_int}  remove_text  ${account_confidence_level_as_string}
    Set Global Variable  ${account_confidence_level_before_dataset_is_connected_as_int}

Get Confidence Levels After Dataset Has Been Added
    Wait Until Page Contains  Model is online
    Input Label To Trained Model
    Wait Until Page Contains Element  ${account_confidence_level}
    ${account_confidence_level_as_string}  Get Text  ${account_confidence_level}
    ${account_confidence_level_after_dataset_is_connected_as_int}  remove_text  ${account_confidence_level_as_string}
    Set Global Variable  ${account_confidence_level_after_dataset_is_connected_as_int}

Compare Confidence Levels Before Dataset Has Been Disconnected
    Should Be True  '${account_confidence_level_before_dataset_is_connected_as_int}'<'${account_confidence_level_after_dataset_is_connected_as_int}'

Compare Confidence Levels After Dataset Has Been Disconnected
    Should Be True  '${account_confidence_level_before_dataset_is_connected_as_int}'=='${account_confidence_level_after_dataset_is_connected_as_int}'

Disconnect Dataset
    Wait Until Element Is Visible  ${disconnect-dataset}
    Scroll Element Into View  ${disconnect-dataset}
    Wait Until Keyword Succeeds  10s  1s  Click Element  ${disconnect-dataset}
    Wait Until Keyword Succeeds  10s  1s  Click Element  @{confirm_disconnect}
Verify Processing Is Inactive
    FOR  ${i}  IN RANGE  0  99  1
    Reload Page
    Wait Until Page Contains  Model is online
    ${status}=  Run Keyword And Return Status  Page Should Not Contain Element  ${grey_dataset_button_2}
    Exit For Loop If  '${status}'=='True'
    Sleep  10s
    END

Verify Processing Is Active
    Reload Page
    Page Should Contain Element  ${grey_dataset_button_2}

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