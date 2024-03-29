*** Variables ***
${CHECKBOX_SHOULD_BE}  check_box
${CHOOSE_DATASET_UNTRAINED_MODEL}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${LABEL_SWITCH}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${CONTINUE_BUTTON2}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${INTENT_CHECKBOX}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[2]
${CATEGORY_CHECKBOX}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[1]
${CATEGORY_CHECKBOX_ONE_CHOICE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th/i
${EXIT_BUTTON}  //*[@id="app"]/div[2]/div/div/nav/div/a/div
*** Keywords ***
Choose Dataset
    Wait Until Element Is Visible  ${CHOOSE_DATASET_BUTTON}
    Scroll Element Into View  ${CHOOSE_DATASET_BUTTON}
    Click Element At Coordinates  ${CHOOSE_DATASET_BUTTON}  10  0
    Wait Until Page Contains  Please click on the column containing the text you want to classify
Enable Train Directly On Labels
    Wait Until Element Is Visible  ${LABEL_SWITCH}
    Click Element  ${LABEL_SWITCH}
Verify Train Directly On Labels Is Enabled
    Wait Until Page Contains  Select the column which contains the labels
Press Continue
    Wait Until Element Is Visible  ${CONTINUE_BUTTON2}
    Click Element  ${CONTINUE_BUTTON2}
    Verify Continue Is Pressed
Verify Continue Is Pressed
    Wait Until Page Contains  Please click on the column containing the labels
Press Intent Checkbox
    Wait Until Element is Visible  ${INTENT_CHECKBOX}
    Click Element  ${INTENT_CHECKBOX}
Press Category Checkbox
    Wait Until Element is Visible  ${CATEGORY_CHECKBOX}
    Click Element  ${CATEGORY_CHECKBOX}
Verify Category Button Is Checked
    ${check_box1}  Get Text  ${CATEGORY_CHECKBOX}/i
    Should Be Equal As Strings  ${check_box1}  ${checkbox_should_be}
Verify Intent Button Is Checked
    ${check_box2}  Get Text  ${INTENT_CHECKBOX}/i
    Should Be Equal As Strings  ${check_box2}  ${checkbox_should_be}
Verify Category Button Is Checked No Choice
    Wait Until Element Is Visible  ${CATEGORY_CHECKBOX_ONE_CHOICE}
    ${check_box3}  Get Text  ${CATEGORY_CHECKBOX_ONE_CHOICE}
    Should Be Equal As Strings  ${check_box3}  ${checkbox_should_be}
Exit Model Creation
    Click Element  ${EXIT_BUTTON} 
    Verify Model Creation Exit
Verify Model Creation Exit
    Wait Until Page Contains  Models | My first workspace
A Dataset With Existing Labels Has Been Selected
    Press Create New Model
    Press Continue To Model Creation
    Choose Dataset
"Train Directly On Labels From An Existing Column" Has Been Enabled
    Enable Train Directly On Labels
    Verify Train Directly On Labels Is Enabled
    Sleep  2s
The User Clicks Continue
    Press Continue
It Shall Be Possible To Select A Column Which Contains The Labels
    Press Intent Checkbox
    Verify Intent Button Is Checked
    Press Category Checkbox
    Verify Category Button Is Checked
    Exit Model Creation
The Column That Contains The Labels Has Been Selected
    Verify Category Button Is Checked No Choice
    Exit Model Creation
