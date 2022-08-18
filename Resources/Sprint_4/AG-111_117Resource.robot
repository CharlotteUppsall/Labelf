*** Variables ***
${password}  123456789
${overview_model}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${button_connectAdditionalDataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${continueButton_id}   //*[@id="continue-dataset-card"]/div
${connectButton_id}   //*[@id="connect-button"]/div
${disconnectDataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/button/div
${confirmDisconnect}   //*[@id="app"]/div[4]/div/div/div[3]/button[2]/div

*** Keywords ***
User Is Logged In
   Login

User Connects An Additional Dataset
   Go To   https://app.labelf.ai/main/384/models/view
   Click Element    ${overview_model}
   Wait Until Element Is Visible    ${button_connectAdditionalDataset}
   Click Element   ${button_connectAdditionalDataset}
   Wait Until Page Contains   Pick a dataset to connect
   Wait Until Page Contains   Dataset ID: 344
   Click Element   ${continueButton_id}
   Wait Until Page Contains   Choose a column containg the text
   Scroll Element Into View  ${connectButton_id}
   Click Element   ${connectButton_id}

Wait Until Element Is Active
   FOR  ${i}  IN RANGE  0  7  1
   Reload Page
   Wait Until Page Contains  support ticket routing model (1)
   ${status}=  Run Keyword And Return Status  Page Should Not Contain Element  ${connect_additional_dataset_greyed_out}
   Run Keyword If  '${status}'=='True'  Connect Another Additional Dataset
   Exit For Loop If  '${status}'=='True'
   Sleep  10s
   END

Confirm Added Additional Dataset Is Shown Under Connected Dataset
   Wait Until Page Contains   Dataset ID: 344
   Wait Until Element Is Visible   ${button_connectAdditionalDataset}

User Clicks Connect Additional Dataset
   Click Element   ${button_connectAdditionalDataset}
   Wait Until Page Contains   Pick a dataset to connect

Additional Connected Dataset Is Not Shown In List
#  Page Should Not Contain   Dataset ID: 344    # verification AG-111
   Page Should Not Contain Element   //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/p
   Reload Page

Disconnects Connected Dataset
   Wait Until Element Is Visible   ${disconnectDataset}
   Click Element   ${disconnectDataset}
   Wait Until Page Contains   This will completely remove your dataset and its contents from the model, are you sure?
   Click Element   ${confirmDisconnect}

Confirmation Of Dataset Has Been Disconnected
   Reload Page
   Wait Until Page Contains   Connected Datasets
   Page Should Not Contain   Dataset ID: 344    # verification AG-117

# GHERKIN
# User Can Confirm AG-111 And AG-117
#    User Is Logged In
#    User Connects An Additional Dataset
#    Wait Until Element Is Active
#    Confirm Added Additional Dataset Is Shown Under Connected Dataset
#    User Clicks Connect Additional Dataset
#    Additional Connected Dataset Is Not Shown In List
#    Disconnects Connected Dataset
#    User Can Confirm Dataset Has Been Disconnected


# "KLASSISK SYNTAX"
User Can Confirm AG-111
    User Connects An Additional Dataset
    Wait Until Element Is Active
    Confirm Added Additional Dataset Is Shown Under Connected Dataset
    User Clicks Connect Additional Dataset
    Additional Connected Dataset Is Not Shown In List

User Can Confirm AG-117
    Disconnects Connected Dataset
    Confirmation Of Dataset Has Been Disconnected