*** Variables ***
${DATAPOINTS_AFTER}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[3]
${DATAPOINTS}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[2]
${DEMO_MODEL_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
${CONNECT_ADDITIONAL_DATASETS_BUTTON}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[3]/nav/div/span/button
${CUSTOMER_SUPPORT_CONTINUE}  //*[@id="continue-dataset-card"]
${CONNECT_DATASETS}  //*[@id="connect-button"]
${DATAPOINTS_CUSTOMER_SUPPORT}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/nav/div/span
${DATAPOINTS_CULTURAL_CENTERS_SURVEY}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[2]/div/div/div/nav/div/span
${CULTURAL_CENTERS_SURVEY_CONTINUE}  //*[@id="continue-dataset-card"]
*** Keywords ***
Select Demo Model
    Scroll Element Into View  ${DEMO_MODEL_BUTTON}
    Wait Until Element Is Visible  ${DEMO_MODEL_BUTTON}
    Click Element  ${DEMO_MODEL_BUTTON}
    Wait Until Page Contains Element  ${HEADER_ELEMENT}
    Wait Until Page Contains  Agile Peacock
Verify Current Number Of Datapoints
    Sleep  5s
    Wait Until Element Is Visible  ${DATAPOINTS}
    ${datapoint_as_string}  Get Text  ${DATAPOINTS}
    ${datapoint_one_dataset}  remove_text  ${datapoint_as_string}
    Set Global Variable  ${datapoint_one_dataset}
    Should Be True  ${datapoint_one_dataset} == 1499
Go To Connect Additional Datasets
    Click Element  ${OVERVIEW_BUTTON}
    Wait Until Page Contains  Model is online
    Scroll Element Into View  ${CONNECT_ADDITIONAL_DATASETS_BUTTON}
    Click Element  ${CONNECT_ADDITIONAL_DATASETS_BUTTON}
    Wait Until Page Contains  Pick a dataset to connect
Connect Additional Dataset
    Click Element  ${CUSTOMER_SUPPORT_CONTINUE}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Wait Until Element Is Visible  ${CONNECT_DATASETS}  
    Scroll Element Into View  ${CONNECT_DATASETS}
    Click Element  ${CONNECT_DATASETS}
    Sleep  2s

Connect Cultural Centers Survey Dataset
    Click Element  ${cultural_centers_survey_continue}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Wait Until Element Is Visible  ${CONNECT_DATASETS}
    Scroll Element Into View  ${CONNECT_DATASETS}
    Click Element  ${CONNECT_DATASETS}
    Sleep  2s
Return To Models Page
    Wait Until Page Contains  test (1)
    Reload Page
    Go Back
    Wait Until Page Contains  Agile Peacock
Verify Number of Datapoints Second Dataset - Customer Support
    Wait Until Element Is Visible  ${datapoints_customer_support}
    ${datapoint_as_string_second_dataset}  Get Text  ${datapoints_customer_support}
    ${datapoint_second_dataset}  remove_text  ${datapoint_as_string_second_dataset}
    Set Global Variable  ${datapoint_second_dataset}
    Should Be True  ${datapoint_second_dataset} == 301


Verify Number of Datapoints Second Dataset - Cultural Centers Survey
    Wait Until Element Is Visible  ${DATAPOINTS_CULTURAL_CENTERS_SURVEY} 
    ${datapoint_as_string_third_dataset}  Get Text  ${DATAPOINTS_CULTURAL_CENTERS_SURVEY} 
    ${datapoint_third_dataset}  remove_text  ${datapoint_as_string_third_dataset}
    Set Global Variable  ${datapoint_third_dataset}
    Should Be True  ${datapoint_third_dataset} == 1419

Verify Number Of Datapoints Increased
    Wait Until Element Is Visible  ${DATAPOINTS_AFTER}
    ${datapoint_as_string_two_datasets}  Get Text  ${DATAPOINTS_AFTER}
    ${datapoint_two_dataset}  remove_text  ${datapoint_as_string_two_datasets}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_second_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_second_dataset}
    Run Keyword If  '${status}'=='False'  Delete And Skip

Verify Number Of Datapoints Increased - Cultural Centers Survey
    Wait Until Element Is Visible  ${DATAPOINTS_AFTER}
    ${datapoint_as_string_two_datasets}  Get Text  ${DATAPOINTS_AFTER}
    ${datapoint_two_dataset}  remove_text  ${datapoint_as_string_two_datasets}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_third_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_third_dataset}
    Run Keyword If  '${status}'=='False'  Delete And Skip
Delete And Skip
    Delete Model
    Skip
The User Has A Trained Model
    Login
    Create Demo Model
    Verify Current Number Of Datapoints
    Go To Connect Additional Datasets
The User Has A Trained Model - 2
    Create Demo Model
    Verify Current Number Of Datapoints
    Go To Connect Additional Datasets
The User Connects An Additional Dataset
    Verify Number of Datapoints Second Dataset - Customer Support
    Connect Additional Dataset
    Return To Models Page
The User Connects An Additional Dataset - 2
    Verify Number of Datapoints Second Dataset - Cultural Centers Survey
    Connect Cultural Centers Survey Dataset
    Return To Models Page
The Number of Datapoints Displayed Under "My Models" Should Increase
    Sleep  2s
    Reload Page
    Verify Number Of Datapoints Increased
    Delete Model
The Number of Datapoints Displayed Under "My Models" Should Increase - 2
    Sleep  2s
    Reload Page
    Verify Number Of Datapoints Increased - Cultural Centers Survey
    Delete Model
