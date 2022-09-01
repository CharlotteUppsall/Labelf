*** Variables ***
${NEW_MODEL_BUTTON}  //*[@id="new-model-button"]
${CONTINUE_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button
${CHOOSE_DATASET_BUTTON}  //*[@id="continue-dataset-card"]
${UPLOAD_PAGE_CONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${INPUT_NAME_TEXT_FIELD}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${MODEL_NAME}  TestModel
${CREATE_MODEL_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
*** Keywords ***
Insert Model Name
    Wait Until Page Contains Element  ${INPUT_NAME_TEXT_FIELD}
    Press Keys  ${INPUT_NAME_TEXT_FIELD}  CTRL+a+BACKSPACE
    Input Text  ${INPUT_NAME_TEXT_FIELD}  ${MODEL_NAME}
Press Create Model Button
    Scroll Element Into View  ${CREATE_MODEL_BUTTON}
    Sleep  3s
    Click Element  ${CREATE_MODEL_BUTTON}
Press Continue On Text Classification Page
    Wait Until Element Is Visible  ${UPLOAD_PAGE_CONTINUE}
    Click Element  ${UPLOAD_PAGE_CONTINUE}
Press Dataset Button
    Wait Until Element Is Visible  ${CHOOSE_DATASET_BUTTON}
    Scroll Element Into View  ${CHOOSE_DATASET_BUTTON}
    Click Element  ${CHOOSE_DATASET_BUTTON}
Press Continue To Model Creation
    Wait Until Page Contains Element  ${CONTINUE_BUTTON}
    Click Element  ${CONTINUE_BUTTON}
Press Create New Model
    Wait Until Page Contains Element  ${NEW_MODEL_BUTTON}
    Click Element  ${NEW_MODEL_BUTTON}
Verify Created Model
    Wait Until Page Contains  ${MODEL_NAME}
Create Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Press Continue On Text Classification Page
    Insert Model Name
    Press Create Model Button
    Verify Created Model
