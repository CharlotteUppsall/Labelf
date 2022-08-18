*** Variables ***
${MenyDatasetButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
${ModelsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[1]/div
${ModelOverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${connectAdditionalDatasetButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${connectAdditionalDatasetButton2}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${workspace_menu}    //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_mySecondWorkspace}  //*[@id="app"]/div[3]/div/div[2]/div[4]/a/div[1]/div
${TestDatasetContinueBotton}  //*[@id="continue-dataset-card"]
${button_connect}   //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button/div
${existing_model_overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${model_overview_button}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${continue_select_dataset}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div

*** Keywords ***
A Model Has Been Created
    Login
    Switch To My Second Workspace

The Model Overview Page Is Opened
   Reload Page
   Wait Until Page Contains Element  ${ModelOverviewButton}
   Click Element   ${ModelOverviewButton}
   Wait Until Page Contains  Name

Connect Additional Datasets Button Shall Be Shown
    Verify Button "Connect Additional Dataset"

Verify Button "Connect Additional Dataset"   # AG-88 Confirmation
   Execute Javascript  window.scrollTo(0,1500)
   Scroll Element Into View   ${connectAdditionalDatasetButton}
   Wait Until Page Contains Element   ${connectAdditionalDatasetButton}

Switch To My Second Workspace
   Go To  https://app.labelf.ai/main/378/models/view
   Wait Until Page Contains   Models | My second workspace



A Dataset Is Uploaded
# kollar att det finns ett dataset uppladdat under fliken "Datasets"
    Reload Page
    Go To  https://app.labelf.ai/main/378/datasets/view
    Sleep  2s
    Wait Until Page Contains  Dataset ID: 438

The Dataset Isn't Connected To The Model
# kollar att det uppladdade datasetet inte redan är connected till vår modell
    Reload Page
    Wait Until Element Is Visible  ${ModelsViewButton}
    Click Element  ${ModelsViewButton}
    Wait Until Page Contains  My Models (1)
    Sleep  5s
    Wait Until Page Contains  support ticket routing model (1)
    Click Element  ${ModelOverviewButton}
    Wait Until Page Contains  Name
    Execute Javascript  window.scrollTo(0,1500)
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Connected Datasets
    Current Frame Should Not Contain  DISCONNECT DATASET

User Is On The Model Overview Page
    Reload Page
    Wait Until Page Contains  Name
# Testet har redan navigerat till sidan

User Clicks On The "Connect Additional Dataset"-Button
    #Execute Javascript  window.scrollTo(0,1500)
    Wait Until Page Contains Element  ${connectAdditionalDatasetButton}
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect

The Dataset Is Displayed In The "My Datasets"-List  #Confirm AG_89
    Wait Until Page Contains  My Datasets
    Wait Until Page Contains  Dataset ID: 438

The User Is On The “Datasets Available To Connect” Page
    Wait Until Page Contains   Datasets available to connect  #redan navigerad till sidan

The Continue Button For A Dataset Is Clicked
    Wait Until Element Is Visible  ${TestDatasetContinueBotton}
    Click Element  ${TestDatasetContinueBotton}
    Wait Until Page Contains   Please click on the column containing the text you want to classify

User Clicks On The Connect Button
    Scroll Element Into View  ${button_connect}
    Wait Until Element Is Visible  ${button_connect}
    Click Element  ${button_connect}

The Dataset Is Listed Under Connected Datasets On The Model Overview  #Confirm AG_91
    Sleep   2s
    Wait Until Page Contains   Connected Datasets
    Wait Until Page Contains   Dataset ID: 438
