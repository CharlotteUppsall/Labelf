
*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py

*** Keywords ***
#Setup and Teardown
Start WebTest
    ${CHROME_OPTIONS}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${CHROME_OPTIONS}    add_argument  --disable-dev-shm-usage
    Call Method    ${CHROME_OPTIONS}    add_argument    test-type
    Call Method    ${CHROME_OPTIONS}    add_argument    --disable-extensions
    Call Method    ${CHROME_OPTIONS}    add_argument    --headless  # Comment away to capture video
    Call Method    ${CHROME_OPTIONS}    add_argument    --disable-gpu
    Call Method    ${CHROME_OPTIONS}    add_argument    --no-sandbox

    Create Webdriver    Chrome    chrome_options=${CHROME_OPTIONS}

    Open Browser  about:blank  chrome
    Set Selenium Speed  0.2s
    Set Selenium Timeout  20s
    Set Window Size  1920  1080
    Go To  ${STAG_LOGIN_SITE}
    Wait Until Element Is Visible  ${DIFFUSE_COOKIE_BUTTON}
    Click Button  ${DIFFUSE_COOKIE_BUTTON}

End WebTest
    #Verify Workspace Is Empty
    Close All Browsers

End Model Creation Test
    Delete Single Automated Test Model
    Close Browser

#Verify Workspace Is Empty
#    FOR  ${i}  IN RANGE  0  5  1
#    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${MY_MODELS}
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
    Input Text  ${LOGIN_EMAIL_FIELD}   ${EMAIL_AGILE_PEACOCK}
    Input Text  ${LOGIN_PASSWORD_FIELD}  ${PASSWORD_AGILE_PEACOCK}
    Wait Until Page Contains  Labelf
Press Login Button
    Click Element  ${LOGIN_BUTTON}
Verify Login
    Wait Until Page Contains  Models | Agile Peacock

#Kimchi Login
Login Kimchi
    Input User Credential
    Press Login Button
    Confirm User Logged In
Input User Credential
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${LOGIN_EMAIL_FIELD}  ${EMAIL_KIMCHI}
    Input Text    ${LOGIN_PASSWORD_FIELD}  ${PASSWORD_KIMCHI}
Confirm User Logged In
    Wait Until Page Contains  My Models
Input User Credential App
    Wait Until Element Is Visible  ${DIFFUSE_COOKIE_BUTTON}
    Click Button  ${DIFFUSE_COOKIE_BUTTON}
    Wait Until Page Contains  Don't have an account? Sign up
    Input Text    ${LOGIN_EMAIL_FIELD}  ${EMAIL_KIMCHI}
    Input Text    ${LOGIN_PASSWORD_FIELD}  ${PASSWORD_KIMCHI}

#COMMON KEYWORDS
user is logged in
    Start WebTest
    Log in User
user creates a new model
    Select "My first Workspace" As Workspace
    Create A Model
#Kattuggla Login
Log in User
    Input Text  ${LOGIN_EMAIL_FIELD}  ${EMAIL_TEST_ACCOUNT}
    Input Text  ${LOGIN_PASSWORD_FIELD}  ${PASSWORD_TEST_ACCOUNT}
    Click Element   ${LOGIN_BUTTON}
    Wait Until Page Contains  My Models

#Kimchi Verify radio button
Multiple Choice Is Provided As Option
    Wait Until Page Contains Element  ${MULTIPLE_CHOICE_BUTTON}
    Wait Until Page Contains  Multiple Choice

#Kimchi Create Model
Create Model
    User Is Logged In And On An Empty Workspace
    User Clicks Button "New Model" And To Create A New Model From Scratch
    Select An Existing Dataset
    Set A Name And Description For Model
    Model Is Created On Workspace
    Model Description Is Presented In Model Overview
User Clicks Button "New Model" And To Create A New Model From Scratch
     Wait Until Page Contains Element  ${NEW_MODEL_BUTTON}
     Sleep  0.2
     Click Element   ${NEW_MODEL_BUTTON}
     Wait Until Page Contains  Add a model
     Click Button  ${CONTINUE_CREATE_MODEL_BUTTON}
     Wait Until Page Contains  Setup

User Is Logged In And On An Empty Workspace
    Go To  ${STAG_WORKSPACE_MODEL_VIEW}
    Wait Until Page Contains  My Models (0)

Delete Single Automated Test Model
    User Is Logged In And On An Workspace Containing One Model
    User Opens Single Model Options Dropdown List
    User Clicks Delete Model Option
    Workspace Is Empty

User Is Logged In And On An Workspace Containing One Model
    Go To  ${STAG_WORKSPACE_MODEL_VIEW}
    Wait Until Page Contains  My Models (1)

User Opens Single Model Options Dropdown List
    Wait Until Page Contains Element  ${SINGLE_MODEL_OPTIONS_BUTTON}
    Click Element  ${SINGLE_MODEL_OPTIONS_BUTTON}

Workspace Is Empty
    Wait Until Page Contains  My Models (0)
    Verify Model Is Deleted
Verify Model Is Deleted
    Wait Until Element Is Visible  ${MY_MODELS_TEXT}
    ${element_text}  Get Text  ${MY_MODELS_TEXT}
    ${actual_amount}  convert into number  ${element_text}
    Should Be True  ${actual_amount} == 0

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${DELETE_OPTION}
    Click Element  ${DELETE_OPTION}
    Wait Until Page Contains Element  ${DELETE_BUTTON}
    Click Button  ${DELETE_BUTTON}

Select An Existing Dataset
     Scroll Element Into View   ${DATA_SELECT_CUSTOMER_SERVICE_BUTTON}
     Sleep  0.2
     Click Element   ${DATA_SELECT_CUSTOMER_SERVICE_BUTTON}
     Wait Until Page Contains  Please click on the column
     Wait Until Page Contains Element  ${CONTINUE_WITH_SELECTED_DATASET_COLUMN_BUTTON}
     Sleep  0.2  # To allow time for page animation
     Click Element  ${CONTINUE_WITH_SELECTED_DATASET_COLUMN_BUTTON}

Set A Name And Description For Model
#Greyed out for loop temp for quicker tests
#     FOR  ${INT}  IN RANGE  36
#        Press Keys  ${INPUT_NAME_TEXT_FIELD}  \\8
#     END
     Press Keys  ${INPUT_NAME_TEXT_FIELD}  CTRL+A+DELETE
     Input Text  ${INPUT_NAME_TEXT_FIELD}   ${MODEL_NAME}
     Input Text   ${INPUT_DESCRIPTION_TEXT_FIELD}  ${MODEL_DESCRIPTION}
     Click Button  ${CREATE_MODEL_BUTTON}
     Wait Until Page Contains  My Models

Model Is Created On Workspace
     Page Should Contain   ${MODEL_NAME}
Model Description Is Presented In Model Overview
    Page Should Contain  ${MODEL_DESCRIPTION}

#Kattuggla Create a Model
Create A Model
#    Sleep  1s
    Wait Until Page Contains Element  ${NEW_MODEL_BUTTON}
    Sleep  0.2
    Click Element  ${NEW_MODEL_BUTTON}
    Wait Until Page Contains  Create your own model from scratch.
    Wait Until Page Contains Element  ${CONTINUE_CREATE_MODEL_BUTTON}
    Click Element  ${CONTINUE_CREATE_MODEL_BUTTON}
    Wait Until Page Contains  Select an existing dataset or upload a new one
    Wait Until Page Contains  Synthetic generic support ticket example data that has half the dataset labeled
    Click Element  ${DATASET_CONTINUE}
    Wait Until Page Contains  Please click on the column containing the text
    Wait Until Element Is Visible  ${COLUMN_CONTINUE}
    Sleep  1s
    Click Element  ${COLUMN_CONTINUE}
    Wait Until Page Contains  Name your model
    Input Text  ${INPUT_NAME_TEXT_FIELD}  ${MODEL_NAME}
    Sleep  1s
    Input Text  ${DESCRIPTION}  This is a Discription of created model
    Click Element  ${CONTINUE_SCRATCH}
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
    Wait Until Page Contains Element  ${INPUT_NAME_TEXT_FIELD}
    Press Keys  ${INPUT_NAME_TEXT_FIELD}  CTRL+a+BACKSPACE
    Input Text  ${INPUT_NAME_TEXT_FIELD}  ${MODEL_NAME}
Press Create Model Button
    Scroll Element Into View  ${CREATE_MODEL_BUTTON}
    Sleep  3s
    Click Element  ${CREATE_MODEL_BUTTON}
Press Continue On Text Classification Page
    Wait Until Element Is Visible  ${UPLOAD_PAGE_CONTINUE}
    Click Element  ${UPLOAD_PAGE_CONTINUE}
Press Dataset Button
    Wait Until Element Is Visible  ${CHOOSE_DATASET_BUTTON}
    Scroll Element Into View  ${CHOOSE_DATASET_BUTTON}
    Click Element  ${CHOOSE_DATASET_BUTTON}
Press Continue To Model Creation
    Wait Until Page Contains Element  ${CONTINUE_BUTTON}
    Click Element  ${CONTINUE_BUTTON}
Press Create New Model
    Wait Until Page Contains Element  ${NEW_MODEL_BUTTON}
    Click Element  ${NEW_MODEL_BUTTON}
Verify Created Model
    Wait Until Page Contains  ${MODEL_NAME}

#Kattuggla See All Labels
User Is Logged In, Have Changed Workspace And Created A Model
    Login Kimchi
    Create Model
    Sleep  30s
User Adds Single Choice Labels
    Wait Until Page Contains Element  ${OVERVIEW_BUTTON}
    Click Element  ${OVERVIEW_BUTTON}
    Wait Until Page Contains  It does not look like you have trained the model
    Wait Until Page Contains Element  ${START_TRAINING}
    Click Element  ${START_TRAINING}
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element  ${ADD_LABEL}
    Click Element  ${ADD_LABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element  ${NEW_LABEL_NAME}
    Input Text  ${NEW_LABEL_NAME}  Katt
    Wait Until Page Contains Element  ${ADD_ONE_LABEL}
    Click Element  ${ADD_ONE_LABEL}
    Wait Until Element Is Visible  ${NAME_ON_FIRST_LABEL}
    Element Text Should Be  ${NAME_ON_FIRST_LABEL}  KATT
    Wait Until Page Contains Element  ${ADD_SECOND_LABEL}
    Click Element  ${ADD_SECOND_LABEL}
    Wait Until Page Contains Element  ${INPUT_TEXT_LABEL2}
    Input Text  ${INPUT_TEXT_LABEL2}  Uggla
    Wait Until Page Contains Element  ${CONFIRM_ADD_SECOND_LABEL}
    #detta element är addlabel efter Uggla
    Click Element  ${CONFIRM_ADD_SECOND_LABEL}
    Wait Until Page Contains  Choose model type
    Sleep  1s
    Wait Until Page Contains Element  ${CHOOSE_SINGLE_CHOICE}
    Click Element  ${CHOOSE_SINGLE_CHOICE}
    Wait Until Page Contains  Lets start by giving Labelf 20 samples
    Wait Until Page Contains Element  ${LABEL_NAMED_KATT}
    Sleep  1s
    Click Element  ${LABEL_NAMED_KATT}
    Wait Until Page Contains  Lets start by giving Labelf 19 samples
    Wait Until Page Contains Element  ${LABEL_NAMED_UGGLA}
    Sleep  1s
    Click Element  ${LABEL_NAMED_UGGLA}
    Wait Until Page Contains  Lets start by giving Labelf 18 samples
    Wait Until Page Contains Element  ${LABEL_NAMED_KATT}
    Sleep  1s
    Click Element  ${LABEL_NAMED_KATT}
    Wait Until Page Contains  Lets start by giving Labelf 17 samples
    Wait Until Page Contains Element  ${LABEL_NAMED_UGGLA}
    Sleep  1s
    Click Element  ${LABEL_NAMED_UGGLA}
    Wait Until Page Contains  Lets start by giving Labelf 16 samples
    Wait Until Page Contains Element  ${LABEL_NAMED_KATT}
    Sleep  1s
    Click Element  ${LABEL_NAMED_KATT}
    Wait Until Page Contains  Only 15 more to go!
User Can See All Labels
    Wait Until Page Contains Element  ${CLOSE_BUTTON}
    Sleep  1s
    Click Element  ${CLOSE_BUTTON}
    Sleep  1s
    Wait Until Page Contains Element  ${MODEL_BUTTON}
    Click Element  ${MODEL_BUTTON}
    Wait Until Page Contains  Team Kimchi
    Delete Single Automated Test Model
Select "My first Workspace" As Workspace
    Go To  https://stag.labelf.ai/main/84/models/view
    Wait Until Page Contains  Models | My first workspace
    Reload Page


User Adds Multiple Choice Label
    Wait Until Page Contains Element  ${OVERVIEW_BUTTON}
    Click Element  ${OVERVIEW_BUTTON}
    Wait Until Page Contains  It does not look like you have trained the model
    Wait Until Page Contains Element  ${START_TRAINING}
    Click Element  ${START_TRAINING}
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Wait Until Page Contains Element  ${ADD_LABEL}
    Click Element  ${ADD_LABEL}
    Wait Until Page Contains  Add a new label
    Wait Until Page Contains Element  ${NEW_LABEL_NAME}
    Input Text  ${NEW_LABEL_NAME}  Katt
    Wait Until Page Contains Element  ${ADD_ONE_LABEL}
    Click Element  ${ADD_ONE_LABEL}
    Wait Until Element Is Visible  ${NAME_ON_FIRST_LABEL}
    Element Text Should Be  ${NAME_ON_FIRST_LABEL}  KATT
    Wait Until Page Contains Element  ${ADD_SECOND_LABELl}
    Click Element  ${ADD_SECOND_LABELl}
    Wait Until Page Contains Element  ${INPUT_TEXT_LABEL2}
    Input Text  ${INPUT_TEXT_LABEL2}  Uggla
    Wait Until Page Contains Element  ${CONFIRM_ADD_SECOND_LABEL}
    #detta element är addlabel efter Uggla
    Click Element  ${CONFIRM_ADD_SECOND_LABEL}
    Wait Until Page Contains  Choose model type
    Sleep  1s

#kattugla delete model
Delete Model
    Wait Until Page Contains  My Models
    Wait Until Page Contains Element  ${MODEL_MENU}
    Click Element  ${MODEL_MENU}
    Wait Until Page Contains Element  ${DELETE}
    Click Element   ${DELETE}
    Sleep  1s
    Wait Until Page Contains Element  ${SURE_DELETE}
    Click Element  ${SURE_DELETE}
    Sleep  1s

#kattuggla log out user
Log Out User
    Sleep  1s
    Wait Until Page Contains Element  ${USER_ACCOUNT}
    Click Element  ${USER_ACCOUNT}
    Wait Until Page Contains Element  ${ACCOUNT_LIST}
    Click Element  ${LOGOUT}
    Wait Until Page Contains  Forgot your password?
    #Location Should Be    #${STAG_LOGIN_PAGE}
Radio Buttons For Created Labels Is Shown
    Wait Until Page Contains  Katt
    Wait Until Page Contains  Uggla

Multiple Choice Is Selected
    Click Element  ${MULTIPLE_CHOICE_BUTTON}



Select Custumer Service Response as Dataset
     Scroll Element Into View   ${DATA_SELECT_CUSTOMER_RESPONSE_BUTTON}
     Sleep  0.2
     Click Element   ${DATA_SELECT_CUSTOMER_RESPONSE_BUTTON}
     Wait Until Page Contains  Please click on the column

     Wait Until Page Contains Element  ${CONTINUE_WITH_SELECTED_DATASET_COLUMN_BUTTON}
     Sleep  0.2  # To allow time for page animation
     Click Element  ${CONTINUE_WITH_SELECTED_DATASET_COLUMN_BUTTON}

User Clicks Button "Overview" And "Start Training" And "Add a label"
    Wait Until Page Contains Element  ${OVERVIEW_BUTTON}
    Click Element  ${OVERVIEW_BUTTON}

    Wait Until Page Contains Element  ${START_TRAINING}
    Click Element  ${START_TRAINING}
    Sleep  150s
    Reload Page
    Sleep  100s
    Reload Page
    Wait Until Page Contains  You must add at least two labels before Labelf can start learning!
    Sleep  0.2
    Wait Until Page Contains Element  ${ADD_A_LABEL_BUTTON}
    Sleep  0.2
    Click Element  ${ADD_A_LABEL_BUTTON}

Input Label Name And Click Add label
    Input Text  ${INPUT_NAME_TEXT_FIELD}  Sport
    Click Element  ${ADD_LABEL_BUTTON}
    Wait until page contains  You must add at least two labels before Labelf can start learning!

    Click element  xpath://span[contains(text(),'Add a label')]

    Press Keys  ${INPUT_NAME_TEXT_FIELD}  CTRL+A+DELETE
    Input Text  ${INPUT_NAME_TEXT_FIELD}  Economy
    Click element  //button[contains(.,'Add label')]

A Third Label Is Added To Model
    Click element  xpath://span[contains(text(),'Add a label')]
    Press Keys  //input[contains(@aria-label,'Name*')]  CTRL+A+DELETE
    Input Text  //input[contains(@aria-label,'Name*')]  Fake News
    Click element  //button[contains(.,'Add label')]

All Labels Are Possible To Select
    Wait until Page Contains  Lets start by giving Labelf 17 samples
    Page should contain Element  //div[contains(text(),'Economy')]
    Page should contain Element  //div[contains(text(),'Fake News')]
    Page should contain Element  //div[contains(text(),'Sport')]
    Click Element  ${FIRST_RADIO_BUTTON}
    Click Element  ${SECOND_RADIO_BUTTON}
    Click Element  ${THIRD_RADIO_BUTTON}
    Click Element  ${THIRD_RADIO_BUTTON}
    Click Button  ${ADD_BUTTON}

#Kattuggla EditModelName
User Is Logged In On Labelf And Have Created An Untained Model
    Log in User
    Create A Model
    Sleep  10s
User Clicks Settings Button In Model Overview
    Sleep  1s
    Click Element  ${OVERFIEW}
#    Wait Until Page Contains Element  ${OVERFIEWBUTTON}
#    Click Element  ${OVERFIEWBUTTON}
    Wait Until Page Contains  It does not look like you have trained the model
    Click Element  ${SETTINGS}
The Edit Model Name Field Is Shown
    Wait Until Page Contains  Edit model name and description
    Click Element  ${MODELS}
    Wait Until Page Contains  Models | My first workspace
    Reload Page
    Delete Model
    Wait Until Page Contains   My Models (0)

#Kimchi 3ModelTrainingStage
User Has Selected Bring Your Own Labels
       Go To  ${StagLoginSite}
       Input User Credential
       Confirm Cookie
       Press Login Button
       Confirm User Logged In
       Go To  ${StagWorkspaceModelView}
       User Clicks Button "New Model" And To Create A New Model From Scratch
       Click Element  ${DataSelectPartlyPreLabledButton}
       Wait Until Page Contains  Please click on the column
       Click Element  ${LabelSwitchButton}
User Clicks Continue
      Wait Until Page Contains Element  ${ContinueWithSelectedDatasetColumnButton}
      Sleep  0.2  # To allow time for page animation
      Click Element  ${ContinueWithSelectedDatasetColumnButton}
      Wait Until Page Contains  Please click on the column containing the labels
The Slider "One Text Can Contain Multiple Labels" Is Presented
      Wait Until Page Contains Element  ${MultiplLabelsSwitchButton}
Verify "One Text Can Have Multiple Labels" Is Enabled When Clicked
      Click Element  ${MultiplLabelsSwitchButton}
      Element Should Be Enabled  ${MultiplLabelsSwitchButton}

Verify that all labels from original dataset are shown in Model overview
     Wait Until Page Contains  Negative
     Wait Until Page Contains  Positive
     Wait Until Page Contains  Neutral
     Wait Until Page Contains  N/A