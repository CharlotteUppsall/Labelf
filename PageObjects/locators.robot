*** Variables ***
#Login Page
${LOGIN_EMAIL_FIELD}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${LOGIN_PASSWORD_FIELD}  //*[@id="password"]
${LOGIN_BUTTON}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${DIFFUSE_COOKIE_BUTTON}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
${MY_MODELS_TEXT}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav/div/div[1]

#Models Page
${WORKSPACE_DROPDOWN_MENU}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]
${STAG_WORKSPACE_MODEL_VIEW}  https://stag.labelf.ai/main/60/models/view
${APP_WORKSPACE_MODEL_VIEW}  https://app.labelf.ai/main/387/models/view
${SINGLE_MODEL_OPTIONS_BUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${OVERVIEW_BUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${OVERVIEW_PRELABLED_BUTTON}  //*[contains(@href,'/main/387/models/3082/dashboard/dashboard')]
${OVERVIEW_PRELABLED_TEST_BUTTON}  //*[contains(@href,'/main/387/models/3049/dashboard/dashboard')]
${NEW_MODEL_BUTTON}   //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${DELETE_OPTIONS}  //*[@class="v-icon icon-menu-danger material-icons theme--light"]
${MODEL_ID3084_NAME_BUTTON_IN_WORKSPACE}  //*[contains(@href,'/main/387/models/3084/dashboard/dashboard')]
${MODELS_BUTTON_IN_MAIN_BAR}  //*[@id="models-button-navbar"]/div

#Models Overview Page

${START_training}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${ADD_LABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${NEW_LABEL_NAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADD_ONE_LABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${NAME_ON_FIRST_LABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[1]/div
${ADD_SECOND_LABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[2]/div
${CHOOSE_SINGLE_CHOICE}  //*[@id="app"]/div[9]/div/div/div[3]/button[1]/div
${INPUT_TEXT_LABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUT_TEXT_LABEL2}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${CONFIRM_ADD_SECOND_LABEL}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[2]/button/div
${CLOSE_BUTTON}  //*[@id="close-button"]
${MODEL_BUTTON}  //*[@id="models-button-navbar"]
${LABEL_NAMED_KATT}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[1]/div
${LABEL_NAMED_UGGLA}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[2]/div


#Model Creation Pages (From Kimchi)
${CONTINUE_CREATE_MODEL_BUTTON}  //button[contains(.,'Continue')]
${INPUT_NAME_TEXT_FIELD}  //input[contains(@aria-label,'Name*')]

${INPUT_DESCRIPTION_TEXT_FIELD}  //*[@name="input-7-1"]
${CREATE_MODEL_BUTTON}  //button[contains(.,'Create Model')]
${SLICE_FAKE_NEWS}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(3) > g
${SLICE_ECONOMY}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(1) > g
${SLICE_SPORT}  css:div#plotly > div.plot-container.plotly > div > svg:nth-child(1) > g.pielayer > g > g:nth-child(2) > g

#Dataset (From Kimchi)
${DATA_SELECT_CUSTOMER_SUPPORT_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DATA_SELECT_CUSTOMER_RESPONCE_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div/div[2]/button/div
${DATA_SELECT_CUSTOMER_SERVICE_BUTTON}  //*[@id="continue-dataset-card"]
${DATA_SELECT_PARTLY_Pre_LABLED_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${CONTINUE_WITH_SELECTED_DATASET_COLUMN_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${USE_LABELS_TO_CONTINUE_TO_TRAIN_THE_MODEL_CHECKBOX}  //*[contains(text(),'Use labels to continue to train the model')]
${CONTINUE_BUTTON_WHEN_ADD_NEW_DATASET}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button
${LABEL_CHECKBOX_WHEN_ADD_NEW_DATASET}  //*[@id="app"]/div[4]/div/div/div/div[6]/div/div/div[1]/div/table/thead/tr[1]/th[3]
${CONNECT_BUTTON_WHEN_ADD_NEW_DATASET}  //*[@id="connect-button"]
${CONTINUE_BUTTON_DATASET_ID470}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button
${CONNECT_ADDTIONAL_DATASET_BUTTON}  //*[contains(text(),' Connect additional datasets ')]
${CONNECT_BUTTON}  //*[contains(text(),' Connect ')]
${DISCONNECT_BUTTON}  //span[contains(.,' Disconnect dataset ')]
${DISCONNECT_AFIRM_BUTTON}  //Button[contains(.,' Disconnect ')]

#Kattuggla all variables (temporarily here)
${MAIN_MENU}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button
${MAIN_MENULIST}  //*[@id="app"]/div[1]/div
${MAIN_MENU_TEAM_KATTUGGLA}  //*[@id="app"]/div[1]/div/div[2]/div[4]/a/div[1]/div
${DATASET_CONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button/div
${DESCRIPTION}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea
${COLUMN_CONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button/div
${MODEL_MENU}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button/div/i
${CONTINUE_SCRATCH}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button/div
${DELETE}  //*[@id="delete-button"]/div[1]/div
#delete #//*[@id="app"]/div[3]/div/div/div[2]/a/div[1]/div
${SURE_DELETE}  //*[@id="app"]/div[6]/div/div/div[3]/button/div
${ATTRIBUT_STRING_TEAM_KATTUGGLA}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/span
${USER_ACCOUNT}  //*[@id="app"]/div[6]/div[1]/nav/div/div[4]/div/button/div/div/span
${ACCOUNT_LIST}  //*[@id="app"]/div[5]/div
${LOGOUT}  //*[@id="app"]/div[5]/div/div[3]/div/a/div[1]/div
${sTAG_LOGIN_PAGE}  //https://stag.labelf.ai/login
${WINDOW}  window-size=1920,1080
${MY_WORKSPACE}  //*[@id="app"]/div[3]/div/div[2]/div[3]/a/div[1]
${TEAM_KATTUGGLA_WORKSPACE}  //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]


#Agile Peacock Sprint 1 Variables (Temporary)
${NEW_MODEL_BUTTON}  //*[@id="new-model-button"]
${CONTINUE_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]
${CHOOSE_DATASET_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[2]/div/div/div[2]/button
${UPLOAD_PAGE_CONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${INPUT_NAME_TEXTFIELD}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${CREATE_MODEL_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button

#Kimchi General Buttons
${DELETE_BUTTON}  //button[contains(.,'Delete')]
${CONTINUE_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${SUBMIT_BUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${CONTINUE_GENERAL_BUTTON}  //*[contains(.,'Continue')]

#Label Training
${ADD_A_FIRST_LABEL_BUTTON}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button   #Adds new label
${ADD_A_LABEL_BUTTON}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div   #Adds new label
${ADD_LABEL_BUTTON}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button  #Adds label when you input label Name
${LABELS_PIECHART}  //*[@id="plotly"]/div[1]/div
${MULTIPLE_CHOICE_BUTTON} //*[@id="app"]/div[14]/div/div/div[3]/button[2]
${ADD_BUTTON}  //button[contains(.,' Add ')]
${FIRST_RADIO_BUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
${SECOND_RADIO_BUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
${THIRD_RADIO_BUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[3]
${LABEL_SWITCH_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${MULTIPLE_LABELS_SWITCHh_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/nav/div/div[3]/div/div/div[1]/div
#ExtendModelVerification
${MODEL_ID3085_NAME_BUTTON_IN_Workspace}  //*[contains(@href,'/main/387/models/3085/dashboard/dashboard')]
${STRING_NUMBER_AFTER}   //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[2]
${STRING_NUMBER_AFTER_ADD_DATASET}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[3]
${CUSTOMER_SERVICE_RESPONCE_DATASET}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div[2]/div/div/div[1]
${NUMBER_TEXT_BEFORE}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[3]/div/div/div/nav/div/span[2]

#SingleLabeling-1.robot
${CHOOSE_MODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${START_TRAINING}  //*[@id="app"]/div[8]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div
${ADD_LABEL}  //*[@id="app"]/div[9]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button/div/span
${NEW_LABEL_NAME}  //*[@id="app"]/div[10]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADD_ONE_LABEL}  //*[@id="app"]/div[10]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[2]/button/div
${NAME_ON_FIRST_LABEL}  //*[@id="app"]/div[13]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[1]/div
${ADD_SECOND_LABEL}  //*[@id="app"]/div[13]/div/div[1]/div[4]/div/div/span/div[2]/div/div[2]/div/div/button[2]/div/span
${CHOOSE_SINGLE}  //*[@id="app"]/div[14]/div/div/div[3]/button[1]/div
${INPUT_TEXT_LABEL}   //*[@id="app"]/div[14]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUT_TEXT_LABEL2}  //*[@id="app"]/div[14]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDED_SECOND_LABEL_DONE}  //*[@id="app"]/div[14]/div/div[1]/div[4]/div/div/span/div[2]/div[2]/form/div[2]/button/div
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODEL_BUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div
${URL}   //https://stag.labelf.ai/login
