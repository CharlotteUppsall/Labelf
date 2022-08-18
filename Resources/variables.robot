*** Variables ***

# URL:s Menu
${stag_login_site}  https://stag.labelf.ai/login
${app_login_site}  https://app.labelf.ai/login

#Agile Peacock Login Information
${email_agile_peacock}  joakim.sorkka@iths.se
${password_agile_peacock}  123456789

#Kimchi Login Information
${email_kimchi}  kimchitest@hotmail.com
${password_kimchi}   Kimchi123

#Login Information
${email_kattuggla}  jakob.nilsson@iths.se
${password_kattuggla}  44321jJa

#Kattuggla all variables (temporarily here)
${MAINMENU}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button
${MAINMENULIST}  //*[@id="app"]/div[1]/div
${MAINMENUTEAMKATTUGGLA}  //*[@id="app"]/div[1]/div/div[2]/div[4]/a/div[1]/div
${NEWMODELBUTTON}  //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a/div/i
${SETUPCONTINUE}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]/button/div
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