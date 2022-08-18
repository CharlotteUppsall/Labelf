*** Variables ***
${newModelButton}  //*[@id="new-model-button"]
${continueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]
${chooseDataSetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button
${uploadPageContinue}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${inputNametextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${modelName}  TestModel
${createModelButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
*** Keywords ***
Insert Model Name
    Wait Until Page Contains Element  ${inputnametextfield}
    Press Keys  ${inputnametextfield}  CTRL+a+BACKSPACE
    Input Text  ${inputnametextfield}  ${modelname}
Press Create Model Button
    Scroll Element Into View  ${createmodelbutton}
    Sleep  3s
    Click Element  ${createmodelbutton}
Press Continue On Text Classification Page
    Wait Until Element Is Visible  ${uploadpagecontinue}
    Click Element  ${uploadpagecontinue}
Press Dataset Button
    Wait Until Element Is Visible  ${choosedatasetbutton}
    Scroll Element Into View  ${choosedatasetbutton}
    Click Element  ${choosedatasetbutton}
Press Continue To Model Creation
    Wait Until Page Contains Element  ${continueButton}
    Click Element  ${continueButton}
Press Create New Model
    Wait Until Page Contains Element  ${newmodelbutton}
    Click Element  ${newmodelbutton}
Verify Created Model
    Wait Until Page Contains  ${modelname}
Create Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Press Continue On Text Classification Page
    Insert Model Name
    Press Create Model Button
    Verify Created Model



