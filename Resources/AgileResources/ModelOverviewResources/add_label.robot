
*** Variables ***
@{ADD_TO_WORKSPACE_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
${FIRST_LEAVE_TRAINING_PAGE}  //*[@id="close-button"]
${SECOND_LEAVE_TRAINING_PAGE}  //*[@id="app"]/div[5]/div/div[1]/div[1]/div/div/nav/div/a/div
${THIRD_LEAVE_TRAINING_PAGE}  //*[@id="app"]/div[15]/div/div[1]/div[1]/div/div/nav/div/a/div
${FOURTH_LEAVE_TRAINING_PAGE}  //*[@id="app"]/div[6]/div/div[1]/div[1]/div/div/nav/div/a/div
${MODEL_ID}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[1]
${START_TRAINING_BUTTON}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]
${FIRST_ADD_LABEL_BUTTON}  //*[@id="add-label"]
${SECOND_ADD_LABEL_BUTTON}  //*[@id="app"]/div[15]/div/div[1]/div[3]/div/a
${THIRD_ADD_LABEL_BUTTON}  //*[@id="app"]/div[5]/div/div[1]/div[3]/div/a
${FOURTH_ADD_LABEL_BUTTON}  //*[@id="app"]/div[16]/div/div[1]/div[3]/div/a
${NEW_LABEL_NAME_TEXT_FIELD}  //*[@id="app"]/div[3]/div/div/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
${NEW_LABEL_EXAMPLE_TEXT_FIELD}  //*[@id="app"]/div[3]/div/div/form/div[2]/div/div/div[3]/div[3]/div/div/div[1]/div[1]/textarea
${SUBMIT_ADD_NEW_LABEL}  //*[@id="app"]/div[3]/div/div/form/div[3]/button
${TOTAL_ITEMS_TEXT}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]
@{TOTAL_LABELED_ITEMS_TEXT}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[4]
*** Keywords ***
Loop Thru Add Label Elements
    Reload Page
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${FIRST_ADD_LABEL_BUTTON}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${FIRST_ADD_LABEL_BUTTON}
    Exit For Loop If  '${status}'=='True'
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${SECOND_ADD_LABEL_BUTTON}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${SECOND_ADD_LABEL_BUTTON}
    Exit For Loop If  '${status}'=='True'
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${THIRD_ADD_LABEL_BUTTON}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${THIRD_ADD_LABEL_BUTTON}
    Exit For Loop If  '${status}'=='True'
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${FOURTH_ADD_LABEL_BUTTON}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${FOURTH_ADD_LABEL_BUTTON}
    Exit For Loop If  '${status}'=='True'
    Reload Page
    END

Leave Training Page
    Sleep  2s
    Wait Until Page Contains  Labeled:
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${FIRST_LEAVE_TRAINING_PAGE}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${FIRST_LEAVE_TRAINING_PAGE}
    Exit For Loop If  '${status}'=='True'
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${SECOND_LEAVE_TRAINING_PAGE}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${SECOND_LEAVE_TRAINING_PAGE}
    Exit For Loop If  '${status}'=='True'
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${THIRD_LEAVE_TRAINING_PAGE}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${THIRD_LEAVE_TRAINING_PAGE}
    Exit For Loop If  '${status}'=='True'
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${FOURTH_LEAVE_TRAINING_PAGE}
    Run Keyword If  '${status}'=='True'  Wait Until Keyword Succeeds  20s  1s  Click Element  ${FOURTH_LEAVE_TRAINING_PAGE}
    Exit For Loop If  '${status}'=='True'
    Reload Page
    END
    Run Keyword If  '${status}'=='False'  Go To  https://app.labelf.ai/main/375/models/${model_id_as_int}/dashboard/dashboard

Submit New Label
    Wait Until Element Is Visible  ${SUBMIT_ADD_NEW_LABEL}
    Click Element  ${SUBMIT_ADD_NEW_LABEL}
    Wait Until Page Contains  Label successfully created  timeout=15
Input New Label Example
    [Arguments]  ${example}
    Input Text  ${NEW_LABEL_EXAMPLE_TEXT_FIELD}  ${example}
Input New Label Name
    [Arguments]  ${name}
    Sleep  1s
    Input Text  ${NEW_LABEL_NAME_TEXT_FIELD}  ${name}
Test Failsafe Skip
    Go To  https://stag.labelf.ai/main/62/models/${model_id_as_int}/dashboard/dashboard
    Skip

Get Model Id
    Wait Until Element Is Visible  ${MODEL_ID}
    ${model_id_as_string}  Get Text  ${MODEL_ID}
    ${model_id_as_int}  remove_text  ${model_id_as_string}
    Set Global Variable  ${model_id_as_int}

Verify Add New Label Is Pressed
    Wait Until Element Is Visible  ${NEW_LABEL_NAME_TEXT_FIELD}
    Wait Until Element Is Visible  ${NEW_LABEL_EXAMPLE_TEXT_FIELD}

Verify Total Number Of Items Before Adding Label
    Wait Until Element Is Visible  ${TOTAL_ITEMS_TEXT}
    ${total_items_as_string}  Get Text  ${TOTAL_ITEMS_TEXT}
    ${total_items_as_int_before_increase}  remove_text  ${total_items_as_string}
    Set Global Variable  ${total_items_as_int_before_increase}

Verify Total Number Of Items After Adding Label
    Wait Until Element Is Visible  ${TOTAL_ITEMS_TEXT}
    ${total_items_as_string}  Get Text  ${TOTAL_ITEMS_TEXT}
    ${total_items_as_int}  remove_text  ${total_items_as_string}
    Set Global Variable  ${total_items_as_int}
    Should Be True  ${total_items_as_int_before_increase} < ${total_items_as_int}

Go To Model Overview
    ${status}=  Run Keyword And Return Status  Wait Until Page Contains Element  //*[@id="model-card-title"]/a
    Run Keyword If  '${status}'=='True'  Click Element   //*[@id="model-card-title"]/a
Press Start Training Button
    Wait Until Element Is Visible  ${START_TRAINING_BUTTON}
    Click Element  ${START_TRAINING_BUTTON}
    Wait Until Page Contains  Labeled:

Go To Start Training Page
    Go To Model Overview
    Get Model Id
    Verify Total Number Of Items Before Adding Label
    Press Start Training Button

Add A Label To Model With Example
    [Arguments]  ${name}  ${example}
    Loop Thru Add Label Elements
    Verify Add New Label Is Pressed
    FOR  ${i}  IN RANGE  0  5  1
    Input New Label Name  ${name}
    Input New Label Example  ${example}
    ${status}=  Run Keyword And Return Status  Submit New Label
    Run Keyword If  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
Add Multiple Labels To Model With Example
    [Arguments]  ${first_name}  ${second_name}   ${first_example}   ${second_example}
    Loop Thru Add Label Elements
    Verify Add New Label Is Pressed
    FOR  ${i}  IN RANGE  0  5  1
    Input New Label Name  ${first_name}
    Input New Label Example  ${first_example}
    ${status}=  Run Keyword And Return Status  Submit New Label
    Run Keyword If  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    FOR  ${i}  IN RANGE  0  5  1
    Loop Thru Add Label Elements
    Verify Add New Label Is Pressed
    Input New Label Name  ${second_name}
    Input New Label Example  ${second_example}
    ${status}=  Run Keyword And Return Status  Submit New Label
    Run Keyword If  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
Add A Label To Model Without Example
    [Arguments]  ${name}
    FOR  ${i}  IN RANGE  0  5  1
    Loop Thru Add Label Elements
    Verify Add New Label Is Pressed
    Input New Label Name  ${name}
    ${status}=  Run Keyword And Return Status  Submit New Label
    Run Keyword If  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END

Add Multiple Labels To Model Without Example
    [Arguments]  ${first_name}  ${second_name}
    FOR  ${i}  IN RANGE  0  5  1
    Loop Thru Add Label Elements
    Verify Add New Label Is Pressed
    Input New Label Name  ${first_name}
    ${status}=  Run Keyword And Return Status  Submit New Label
    Run Keyword If  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    FOR  ${i}  IN RANGE  0  5  1
    Loop Thru Add Label Elements
    Verify Add New Label Is Pressed
    Input New Label Name  ${second_name}
    ${status}=  Run Keyword And Return Status  Submit New Label
    Run Keyword If  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
Model Is Offline
    Wait Until Page Contains Element  //*[@id="app"]/div[3]/div/div/nav/div/button
    Click Element  //*[@id="app"]/div[3]/div/div/nav/div/button
Verify Items Increase
    Leave Training Page
    Model Is Offline
    Verify Total Number Of Items After Adding Label

Verify Items Did Not Increase
    Leave Training Page
    Model Is Offline
    Verify Total Number Of Items Before Adding Label
The User Is Already On "Start Training" Page
    Get Model Id
    Verify Total Number Of Items Before Adding Label
    Press Start Training Button
A Demo Model Is Created
    Verify Demo Model Is Created
The User Is On "Start Training" Page
    Go To Start Training Page
The User Adds A Label Without Example
    Add A Label To Model Without Example  Dog

The User Adds Multiple Labels Without Example
    Add Multiple Labels To Model Without Example  Cat  Bird
The User Adds A Label With Example
    Add A Label To Model With Example  Frog  Amphibian

The User Adds Multiple Labels With Example
    Add Multiple Labels To Model With Example  Turtle  Comodo Dragon  Reptile   Reptile
The Model Should Not Increase "Total Items" And/Or "Labeled Items"
    Verify Items Did Not Increase
    Verify Total Number Of Items Before Adding Label
The Model Should Increase "Total Items" And "Labeled Items"
    Verify Items Increase
    Verify Total Number Of Items Before Adding Label

Create Demo Model
    Press Create New Model
    Click Element  @{ADD_TO_WORKSPACE_BUTTON}
Verify Demo Model Is Created
    Wait Until Page Contains  test (1)  timeout=25


