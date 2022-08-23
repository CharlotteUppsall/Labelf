*** Settings ***
Resource  variables.robot
Resource  locators.robot

Library  ../Scripts/remove_text.py

*** Keywords ***
#Setup and Teardown
Start WebTest
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument  --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless  # Comment away to capture video
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${chrome_options}

    Open Browser  about:blank  chrome
    Set Selenium Speed  0.2s
    Set Window Size  1920  1080
    Go To  ${stag_login_site}
    Wait Until Element Is Visible  ${diffuse_cookie_button}
    Click Button  ${diffuse_cookie_button}

End WebTest
    #Verify Workspace Is Empty
    Close All Browsers

#Verify Workspace Is Empty
#    FOR  ${i}  IN RANGE  0  5  1
#    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${my_models}
#    Run Keyword If  '${status}'=='False'  Go To  https://app.labelf.ai/main/375/models/view
#    ${status}=  Run Keyword And Return Status  Verify Model Is Deleted
#    Run Keyword If  '${status}'=='False'  Delete Model
#    Exit For Loop If  '${status}'=='True'
#    END

#Agile Peacock Login
Login
    Enter Account Information
    Press Login Button
    Verify Login
    #Verify Workspace Is Empty
Enter Account Information
    Input Text  ${login_email_field}   ${e_mail_agile_peacock}
    Input Text  ${login_password_field}  ${password_agile_peacock}
    Wait Until Page Contains  Labelf
Press Login Button
    Click Element  ${LoginButton}
Verify Login
    Wait Until Page Contains  Models | Agile Peacock

#Kimchi Login
Input User Credential
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${login_email_field}  ${email_kimchi}
    Input Text    ${login_password_field}  ${password_kimchi}
Confirm Cookie
    Sleep  0.2
    Click Button  ${diffuse_cookie_button}
Confirm User Logged In
    Wait Until Page Contains  My Models

#Kattuggla Login
Log in User
    Input Text  ${login_email_field}  ${email_kattuggla}
    Input Text  ${login_password_field}  ${password_kattuggla}
    Click Element   ${login_button}
    Wait Until Page Contains  My Models

#Kimchi Create Model
Create Model
    User Is Logged In And On An Empty Workspace
    User Clicks Button "New Model" And To Create A New Model From Scratch
    Select An Existing Dataset
    Set A Name And Description For Model
    Model Is Created On Workspace
    Model Description Is Presented In Model Overview
User Clicks Button "New Model" And To Create A New Model From Scratch
     Wait Until Page Contains Element  ${new_model_button}
     Sleep  0.2
     Click Element   ${new_model_button}
     Wait Until Page Contains  Add a model
     Click Button  ${continue_create_model_button}
     Wait Until Page Contains  Setup
User Is Logged In And On An Empty Workspace
    Go To  ${stag_workspace_model_view}
    Wait Until Page Contains  My Models (0)

Delete Single Automated Test Model
    User Is Logged In And On An Workspace Containing One Model
    User Opens Single Model Options Dropdown List
    User Clicks Delete Model Option
    Workspace Is Empty

User Is Logged In And On An Workspace Containing One Model
    Go To  ${stag_workspace_model_view}
    Wait Until Page Contains  My Models (1)

User Opens Single Model Options Dropdown List
    Wait Until Page Contains Element  ${single_model_options_button}
    Click Element  ${single_model_options_button}

Workspace Is Empty
    Wait Until Page Contains  My Models (0)
    Verify Model Is Deleted
Verify Model Is Deleted
    Wait Until Element Is Visible  ${my_models_text}
    ${element_text}  Get Text  ${my_models_text}
    ${actual_amount}  convert into number  ${element_text}
    Should Be True  ${actual_amount} == 0

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${delete_option}
    Click Element  ${delete_option}
    Wait Until Page Contains Element  ${DeleteButton}
    Click Button  ${DeleteButton}

Select An Existing Dataset
     Scroll Element Into View   ${DataSelectCustomerSupportButton}
     Sleep  0.2
     Click Element   ${DataSelectCustomerSupportButton}
     Wait Until Page Contains  Please click on the column
     Wait Until Page Contains Element  ${ContinueWithSelectedDatasetColumnButton}
     Sleep  0.2  # To allow time for page animation
     Click Element  ${ContinueWithSelectedDatasetColumnButton}

Set A Name And Description For Model
     FOR  ${INT}  IN RANGE  36
        Press Keys  ${InputNameTextField}  \\8
     END
     Press Keys  ${InputNameTextField}  CTRL+A+DELETE
     Input Text  ${InputNameTextField}   ${ModelName}
     Input Text   ${InputDescriptiontextField}  ${ModelDescription}
     Click Button  ${CreateModelButton}
     Wait Until Page Contains  My Models

Model Is Created On Workspace
     Page Should Contain   ${ModelName}
Model Description Is Presented In Model Overview
    Page Should Contain  ${ModelDescription}

#Kattuggla Create a Model
Create A Model
    Sleep  1s
    Wait Until Page Contains Element  ${new_model_button}
    Click Element  ${new_model_button}
    Wait Until Page Contains  Create your own model from scratch.
    Wait Until Page Contains Element  ${continue_create_model_button}
    Click Element  ${continue_create_model_button}
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  ${DATASETCONTINUE}
    Wait Until Page Contains  Please click on the column containing the text
    Wait Until Element Is Visible  ${COLUMNCONTINUE}
    Sleep  1s
    Click Element  ${COLUMNCONTINUE}
    Wait Until Page Contains  Name your model
    Input Text  ${input_name_text_field}  ${model_name}
    Sleep  1s
    Input Text  ${DESCRIPTION}  This is a Discription of created model
    Click Element  ${CONTINUESCRATCH}
    Wait Until Page Contains  Please click on the column containing the text
    Sleep  1s

#Agile Peacock Create Model
#Create Model
#    Press Create New Model
#    Press Continue To Model Creation
#    Press Dataset Button
#    Press Continue On Text Classification Page
#    Insert Model Name
#    Press Create Model Button
#    Verify Created Model
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

#Kattuggla See All Labels
User Is Logged In, Have Changed Workspace And Created A Model
    Log in User
    Select Team Kattuggla As Workspace
    Create Model

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

