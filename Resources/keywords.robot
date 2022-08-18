*** Variables ***
${WINDOW}  window-size=1920,1080

*** Keywords ***
Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    ${WINDOW}
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Selenium Timeout  10s

Go To Web Page
    Go to  ${URL}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]

Log in User
    Input Text  ${MAIL}   jakob.nilsson@iths.se
    Input Text  ${PASSWORD}  44321jJa
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  Welcome to Labelf!


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


Create A Model
    Sleep  1s
    Wait Until Page Contains Element  ${NEWMODELBUTTON}
    Click Element  ${NEWMODELBUTTON}
    Wait Until Page Contains  Create your own model from scratch.
    Wait Until Page Contains Element  ${SETUPCONTINUE}
    Click Element  ${SETUPCONTINUE}
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  ${DATASETCONTINUE}
    Wait Until Page Contains  Please click on the column containing the text
    Wait Until Element Is Visible  ${COLUMNCONTINUE}
    Sleep  1s
    Click Element  ${COLUMNCONTINUE}
    Wait Until Page Contains  Name your model
    Sleep  1s
    Input Text  ${DESCRIPTION}  This is a Discription of created model
    Click Element  ${CONTINUESCRATCH}
    Wait Until Page Contains  Please click on the column containing the text
    Sleep  1s

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

