*** Variables ***
#Login Page
${login_email_field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${login_password_field}  //*[@id="password"]
${login_button}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${diffuse_cookie_button}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
${my_models_text}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav/div/div[1]

#Models Overview Page
${workspace_dropdown_menu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]
${stag_workspace_model_view}  https://stag.labelf.ai/main/60/models/view
${app_workspace_model_view}  https://app.labelf.ai/main/387/models/view
${single_model_options_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${overview_prelabled_button}  //*[contains(@href,'/main/387/models/3082/dashboard/dashboard')]
${overview_prelabled_test_button}  //*[contains(@href,'/main/387/models/3049/dashboard/dashboard')]
${new_model_button}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${delete_option}  //*[@class="v-icon icon-menu-danger material-icons theme--light"]
${model_ID3084_name_button_in_workspace}  //*[contains(@href,'/main/387/models/3084/dashboard/dashboard')]
${models_button_in_main_bar}  //*[@id="models-button-navbar"]/div

#Model Creation Pages (From Kimchi)
${continue_create_model_button}  //button[contains(.,'Continue')]
${input_name_text_field}  //input[contains(@aria-label,'Name*')]
${model_name}  Data Model
${input_description_text_field}  //*[@name="input-7-1"]
${model_description}  This is A Model
${create_model_button}  //button[contains(.,'Create Model')]
${StartTrainingButton}  //*[contains(text(),' Start training ')]
${SliceFakeNews}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(3) > g
${SliceEconomy}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(1) > g
${SliceSport}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(2) > g

#Dataset (From Kimchi)
${DataSelectCustomerSupportButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DataSelectCustomerResponseButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${DataSelectPartlyPreLabledButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${ContinueWithSelectedDatasetColumnButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${UseLabelsToContinueToTrainTheModelCheckBox}  //*[contains(text(),'Use labels to continue to train the model')]
${ContinueButtonWhenAddNewDataset}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button
${LabelCheckBoxWhenAddNewDataset}  //*[@id="app"]/div[4]/div/div/div/div[6]/div/div/div[1]/div/table/thead/tr[1]/th[3]
${ConnectButtonWhenAddNewDataset}  //*[@id="connect-button"]
${ContinueButtonDatasetID470}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button
${ConnectAddtionalDatasetButton}  //*[contains(text(),' Connect additional datasets ')]
${ConnectButton}  //*[contains(text(),' Connect ')]
${DisconnectButton}  //span[contains(.,' Disconnect dataset ')]
${DisconnectAfirmButton}  //Button[contains(.,' Disconnect ')]

#Kattuggla all variables (temporarily here)
${MAINMENU}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button
${MAINMENULIST}  //*[@id="app"]/div[1]/div
${MAINMENUTEAMKATTUGGLA}  //*[@id="app"]/div[1]/div/div[2]/div[4]/a/div[1]/div
${DATASETCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DESCRIPTION}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea
${COLUMNCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button/div
${MODELMENU}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${CONTINUESCRATCH}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button/div
${DELETE}  //*[@id="app"]/div[3]/div/div/div[2]/a/div[1]/div
${SUREDELETE}  //*[@id="app"]/div[3]/div/div/div[3]/button/div
${ATTRIBUTSTRINGTEAMKATTUGGLA}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/span
${USERACCOUNT}  //*[@id="app"]/div[6]/div[1]/nav/div/div[4]/div/button/div/div/span
${ACCOUNTLIST}  //*[@id="app"]/div[5]/div
${LOGOUT}  //*[@id="app"]/div[5]/div/div[3]/div/a/div[1]/div
${WINDOW}  window-size=1920,1080
${MYWORKSPACE}  //*[@id="app"]/div[3]/div/div[2]/div[3]/a/div[1]
${TEAMKATTUGGLAWORKSPACE}  //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]

#Agile Peacock Sprint 1 Variables (Temporary)
${newModelButton}  //*[@id="new-model-button"]
${continueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]
${chooseDataSetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button
${uploadPageContinue}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${inputNametextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${modelName}  TestModel
${createModelButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button

#Kimchi General Buttons
${delete_button}  //button[contains(.,'Delete')]
${continue_button}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${submit_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${continue_general_button}  //*[contains(.,'Continue')]