*** Variables ***
#Login Page
${login_email_field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${login_password_field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input
${login_button}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${diffuse_cookie_button}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]

#Models Overview Page (From Kimchi)
${workspace_dropdown_menu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]
${stag_workspace_model_view}  https://stag.labelf.ai/main/60/models/view
${app_workspace_model_view}  https://app.labelf.ai/main/387/models/view
${single_model_options_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${overview_prelabled_button}  //*[contains(@href,'/main/387/models/3082/dashboard/dashboard')]
${Overview_prelabled_test_button}  //*[contains(@href,'/main/387/models/3049/dashboard/dashboard')]
${new_model_button}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${delete_option}  //*[@class="v-icon icon-menu-danger material-icons theme--light"]
${model_ID3084_name_button_in_workspace}  //*[contains(@href,'/main/387/models/3084/dashboard/dashboard')]
${models_button_in_main_bar}  //*[@id="models-button-navbar"]/div

#Model Creation Pages (From Kimchi)
${ContinueCreateModelButton}  //button[contains(.,'Continue')]
${InputNameTextField}  //input[contains(@aria-label,'Name*')]
${ModelName}  Data Model
${InputDescriptionTextField}  //*[@name="input-7-1"]
${ModelDescription}  This is A Model
${CreateModelButton}  //button[contains(.,'Create Model')]
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