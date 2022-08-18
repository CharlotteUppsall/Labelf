*** Variables ***
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

#GeneralButtons
${DeleteButton}  //button[contains(.,'Delete')]
${ContinueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${SubmitButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${ContinueGenralButton}  //*[contains(.,'Continue')]


#ExtendModelVerification
${ModelID3085NameButtonInWorkspace}  //*[contains(@href,'/main/387/models/3085/dashboard/dashboard')]
${StringNumberAfter}   //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[2]
${StringNumberAfterAddDataSet}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div/span[3]
${CustomerServiceResponseDataSet}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div[2]/div/div/div[1]
${NumberTextBefore}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[3]/div/div[3]/div/div/div/nav/div/span[2]
