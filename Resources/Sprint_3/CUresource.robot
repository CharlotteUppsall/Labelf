*** Variables ***
${password}  123456789
# ${Main_Page} # se om den behövs
${workspace_menu}   //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_menu2}   //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_hello}   //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]/div
${workspace_hello2}   //*[@id="app"]/div[4]/div/div[2]/div[5]/a/div[1]/div
${pre_existing_model_overview}   //*[@id="app"]/div[8]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/div[2]/a/div
${existing_model_overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${model_overview_button}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${connect_additional_dataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${continue_select_dataset}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div
${continue_connect}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div
${button_connect}   //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
${scroll_to_dataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[1]/h4
${disconnect_dataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/button/div
${popUp_confirm_disconnect}    //*[@id="app"]/div[4]/div/div/div[3]/button[2]/div
${popUp_confirm_disconnect2}   //*[@id="app"]/div[3]/div/div/div[3]/button[2]/div
*** Keywords ***
Switch To Hello Workspace
   Click Element  ${workspace_menu}
   Scroll Element Into View   //*[@id="app"]/div[4]/div/div[2]/div[4]/a/div[1]/div  #${workspace_hello}
   Click Element   //*[@id="app"]/div[4]/div/div[2]/div[4]/a/div[1]/div  #${workspace_hello}
   Wait Until Page Contains   Models | My second workspace
Go To Model Overview on Pre-existing Model
   Click Element   ${existing_model_overview}
   Wait Until Page Contains Element    ${model_overview_button}
Verify Button "Connect Additional Dataset"   # AG-88 Confirmation
   Scroll Element Into View   ${connect_additional_dataset}
   Wait Until Page Contains Element   ${connect_additional_dataset}


Verify Connected Dataset Is Listed Under Connected Datasets    # AG-91 Confirmation
   Click Element   ${connect_additional_dataset}
   Wait Until Page Contains   Datasets available to connect
   Click Element   ${continue_select_dataset}
   Wait Until Page Contains   Please click on the column containing the text you want to classify
   Wait Until Element Is Visible    ${button_connect}
   Click Element   ${button_connect}
   Sleep   2s
   Wait Until Page Contains   Connected Datasets
   Wait Until Page Contains   Dataset ID: 344



# Disconnect Connected Dataset
#   Click Element   ${disconnect_dataset}
#   Wait Until Page Contains   This will completely remove your dataset and its contents from the model, are you sure?
#   Click Element  //*[@id="app"]/div[3]/div/div/div[3]/button[2]/div
#   Wait Until Element Is Visible   ${connect_additional_dataset}
#   Page Should Not Contain Textfield    Dataset ID: 344
#   Click Element   //*[@id="app"]/div[7]/div[1]/nav/div/a[1]/div/span[1]
#   Sleep   2s
#   Click Element   //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
#   Scroll Element Into View   ${connect_additional_dataset}
#   Page Should Not Contain Textfield    Dataset ID: 344
# User Can Confirm Button "Connect Additional Dataset" Is Shown In Model Overview Page
#   Switch To Hello Workspace
#   Go To Model Overview on Pre-existing Model
#   Verify Button "Connect Additional Dataset"
# User Can Confirm Connected Dataset Listed As Connected Datset On Model Overview Page
#   Steps In Connect Additional Dataset
#   Verify Connected Dataset Is Listed Under Connected Datasets
# Disconnect Dataset
#   Disconnect Connected Dataset