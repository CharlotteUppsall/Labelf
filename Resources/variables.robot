*** Variables ***
# URL:s Menu
${stag_login_site}  https://stag.labelf.ai/login

#Agile Peacock Login Information
${email_agile_peacock}  joakim.sorkka@iths.se
${password_agile_peacock}  123456789

#Kimchi Login Information
${email_kimchi}  kimchitest@hotmail.com
${password_kimchi}   Kimchi123

#Login Information
${email_kattuggla}  jakob.nilsson@iths.se
${password_kattuggla}  44321jJa

#Label Training
${AddALabelButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div   #Adds new label
${AddLabelButton}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button  #Adds label when you input label Name
${LabelsPieChart}  //*[@id="plotly"]/div[1]/div
${MultipleChoiceButton}  //button[contains(.,'Multiple Choice')]
${AddButton}  //button[contains(.,' Add ')]
${FirstRadioButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[1]
${SecondRadioButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[2]
${ThirdRadioButton}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div/div[2]/div/div[3]
${LabelSwitchButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${MultiplLabelsSwitchButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/nav/div/div[3]/div/div/div[1]/div

#ExtendModelVerification
${ModelID3085NameButtonInWorkspace}  //*[contains(@href,'/main/387/models/3085/dashboard/dashboard')]
${StringNumberAfter}   //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[2]
${StringNumberAfterAddDataSet}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[3]
${CustomerServiceResponseDataSet}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div[2]/div/div/div[1]
${NumberTextBefore}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[3]/div/div/div/nav/div/span[2]

#Login Page locators
${login_email_field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${login_password_field}  //*[@id="password"]
${login_button}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${diffuse_cookie_button}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
${my_models_text}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav/div/div[1]