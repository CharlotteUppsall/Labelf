*** Variables ***

*** Keywords ***

Go To Web Page
    Go to  ${URL}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]

Select Team Kattuggla As Workspace
    Sleep  1s
    Wait Until Page Contains Element  ${MAINMENU}
    Click Element  ${MAINMENU}
    Wait Until Page Contains  Current Workspace:
    Scroll Element Into View  ${TEAMKATTUGGLAWORKSPACE}
    Click Element  ${TEAMKATTUGGLAWORKSPACE}
    Wait Until Location Is  https://stag.labelf.ai/main/68/models/view
    #Ceck the id in the link if its the right workspace
    Wait Until Page Contains  My first workspace
    Click Element  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button

Delete Model
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODELMENU}
    Click Element  ${MODELMENU}
    Wait Until Page Contains Element  ${DELETE}
    Click Element  ${DELETE}
    Sleep  1s
    Wait Until Page Contains Element  ${SUREDELETE}
    Click Element  ${SUREDELETE}
    Sleep  1s

Log Out User
    Sleep  1s
    Wait Until Page Contains Element  ${USERACCOUNT}
    Click Element  ${USERACCOUNT}
    Wait Until Page Contains Element  ${ACCOUNTLIST}
    Click Element  ${LOGOUT}
    Location Should Be  ${URL}

End Web Test
    Close Browser

