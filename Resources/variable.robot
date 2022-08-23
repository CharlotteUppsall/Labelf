*** Variables ***
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


#EditModelName.robot
${OVERFIEW}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
${OVERFIEWBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${SETTINGS}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
${MODELS}  //*[@id="app"]/div[4]/div[1]/nav/div/a[1]/div/span[1]



#Hamburger.robot
${TEAMKATTUGGLA}  //*[@id="app"]/div[1]/div/div[2]/div[5]
${MYFIRSTWORKSPACE2}  //*[@id="app"]/div[1]/div/div[2]/div[4]
${MYFIRSTWORKSPACE}  //*[@id="app"]/div[1]/div/div[2]/div[3]
${CREATEWORKSPACE}  //*[@id="app"]/div[1]/div/div[2]/div[2]



#KAT-82.robot
${MODELSBUTTON}  //*[@id="app"]/div[7]/div[1]/nav/div/a[1]/div
${TEAMKATTUGGLAU}  //*[@id="app"]/div[1]/div/div[2]/div[5]/a/div[1]
${CLICKAWAY}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button


#KAT_81.robot
${OVERVIEW}     //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
${SETTINGBUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[1]/div/i
${INPUTMODELNAME}  //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
${SAVEBUTTON}    //*[@id="app"]/div[4]/div[1]/main/div/div/div[2]/div/div/div/div/div/div/div[1]/form/div[3]/button/div/i
${MODELSBUTTON}  //*[@id="app"]/div[4]/div[1]/nav/div/a[1]/div/span[1]


#NavToWorkspace.robot
${TKU}  //*[@id="app"]/div[1]/div/div[2]/div[5]
${MFW1}  //*[@id="app"]/div[1]/div/div[2]/div[4]
${MFW2}  //*[@id="app"]/div[1]/div/div[2]/div[3]


#SeeAllLabels.robot
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${ADDLABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${NEWLABELNAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDONELABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${NAMEONFIRSTLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${ADDSEKUNDLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${CHOOSESINGLE}  //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${INPUTTEXTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUTTEXTLABEL2}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDEDSECONDLABELDONE}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div
${KATTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${UGGLALABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div


#SingleLabeling-1.robot
${CHOOSEMODEL}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${STARTTRAINING}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div[2]/div/a/div
${ADDLABEL}  //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div
${NEWLABELNAME}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDONELABEL}  //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${NAMEONFIRSTLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${ADDSEKUNDLABEL}  //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${CHOOSESINGLE}  //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${INPUTTEXTLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${INPUTTEXTLABEL2}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDEDSECONDLABELDONE}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${XBUTTON}  //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div


#SingleLabeling-2.robot
${BODYMODEL}              //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${STARTTRAINING}          //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]/div
${ADDLABEL}               //*[@id="app"]/div[4]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button/div/span
${FIRSTNAMELABEL}         //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDAFIRSTNAMEDLABEL}    //*[@id="app"]/div[5]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${ADDASECOUNDLABEL}       //*[@id="app"]/div[7]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${SECOUNDNAMELABEL}       //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${ADDASECOUNDNAMEDLABEL}  //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div[2]/form/div[2]/button/div
${SINGLECHOISE}           //*[@id="app"]/div[8]/div/div/div[3]/button[1]/div
${TEST1LABEL}             //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${DATAPOINT}              //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[1]/div[1]/div/span
${ESCBUTTON}              //*[@id="app"]/div[8]/div/div[1]/div[1]/div/div/nav/div/a/div/i
${MODELBUTTON}            //*[@id="app"]/div[9]/div[1]/nav/div/a[1]/div/i
${ADDALABEL}              //*[@id="app"]/div[8]/div/div[1]/div[3]/div/a/div/span
${NAMEONTHIRDLABEL}       //*[@id="app"]/div[2]/div/div/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
${ADDLABELBUTTON}         //*[@id="app"]/div[2]/div/div/form/div[3]/button/div
${LABEL1}                 //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[1]/div
${LABEL2}                 //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[2]/div
${LABEL3}                 //*[@id="app"]/div[8]/div/div[1]/div[4]/div/div/span/div/div/div[2]/div/div/button[3]/div


#webtest.robot
