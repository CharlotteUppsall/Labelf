*** Variables ***
${datapoints}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[2]
${datapoints_processing}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[3]
${demo_model_button}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${connect_additional_datasets_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${customer_support_continue}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button
${connect_datasets}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
${datapoints_customer_support}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/nav/div/span


${datapoints_cultural_centers_survey}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/nav/div/span
${cultural_centers_survey_continue}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button

*** Keywords ***
Select Demo Model
    Scroll Element Into View  ${demo_model_button}
    Wait Until Element Is Visible  ${demo_model_button}
    Click Element  ${demo_model_button}

    Wait Until Page Contains Element  ${header_element}
    Wait Until Page Contains  Agile Peacock
Verify Current Number Of Datapoints
    Sleep  5s
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string}  Get Text  ${datapoints}
    ${datapoint_one_dataset}  remove comma and convert  ${datapoint_as_string}
    Set Global Variable  ${datapoint_one_dataset}
    Should Be True  ${datapoint_one_dataset} == 1285
Go To Connect Additional Datasets
    Click Element  ${overview_button}
    Wait Until Page Contains  Model is online
    Scroll Element Into View  ${connect_additional_datasets_button}
    Click Element  ${connect_additional_datasets_button}
    Wait Until Page Contains  Pick a dataset to connect
Connect Additional Dataset
    Click Element  ${customer_support_continue}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Wait Until Element Is Visible  ${connect_datasets}  
    Scroll Element Into View  ${connect_datasets}
    Click Element  ${connect_datasets}
    Sleep  2s

Connect Cultural Centers Survey Dataset
    Click Element  ${cultural_centers_survey_continue}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Wait Until Element Is Visible  ${connect_datasets}  
    Scroll Element Into View  ${connect_datasets}
    Click Element  ${connect_datasets}
    Sleep  2s
Return To Models Page
    Wait Until Page Contains  support ticket routing model (1)
    Reload Page
    Go To  https://app.labelf.ai/main/375/models/view
    Wait Until Page Contains  Agile Peacock
Verify Number of Datapoints Second Dataset - Customer Support
    Wait Until Element Is Visible  ${datapoints_customer_support}
    ${datapoint_as_string_second_dataset}  Get Text  ${datapoints_customer_support}
    ${datapoint_second_dataset}  remove comma and convert  ${datapoint_as_string_second_dataset}
    Set Global Variable  ${datapoint_second_dataset}
    Should Be True  ${datapoint_second_dataset} == 1302


Verify Number of Datapoints Second Dataset - Cultural Centers Survey
    Wait Until Element Is Visible  ${datapoints_cultural_centers_survey}
    ${datapoint_as_string_third_dataset}  Get Text  ${datapoints_cultural_centers_survey}
    ${datapoint_third_dataset}  Convert To Integer  ${datapoint_as_string_third_dataset}
    Set Global Variable  ${datapoint_third_dataset}
    Should Be True  ${datapoint_third_dataset} == 637

Verify Number Of Datapoints Increased
    Wait Until Element Is Visible  ${datapoints_processing}
    ${datapoint_as_string_two_datasets}  Get Text  ${datapoints_processing}
    ${datapoint_two_dataset}  remove comma and convert  ${datapoint_as_string_two_datasets}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_second_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_second_dataset}
    Run Keyword If  '${status}'=='False'  Delete And Skip

Verify Number Of Datapoints Increased - Cultural Centers Survey
    Wait Until Element Is Visible  ${datapoints_processing}
    ${datapoint_as_string_two_datasets}  Get Text  ${datapoints_processing}
    ${datapoint_two_dataset}  remove comma and convert  ${datapoint_as_string_two_datasets}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_third_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    ${status}=  Run Keyword And Return Status  Should Be True  ${datapoint_two_dataset} > ${datapoint_third_dataset}
    Run Keyword If  '${status}'=='False'  Delete And Skip
Delete And Skip
    Delete Model
    Skip
The User Has A Trained Model
    Login
    Create Support Ticket Demo Model 
    Verify Current Number Of Datapoints
    Go To Connect Additional Datasets
The User Has A Trained Model - 2
    Create Support Ticket Demo Model
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
