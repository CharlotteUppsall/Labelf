*** Variables ***
${click_pre-existing_model}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${click_text_area2}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[1]/div/div[1]/div/textarea
${submit_knapp}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[2]/button[2]
${category_account}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[1]
${add_demo_model_to_workspace}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
*** Keywords ***
Verify Demo Model Is Created
    Wait Until Page Contains  support ticket routing model (1)  timeout=10
Press Add Model To Workspace
    Wait Until Page Contains Element  ${add_demo_model_to_workspace}
    Scroll Element Into View  ${add_demo_model_to_workspace}
    Click Element  ${add_demo_model_to_workspace}
Create Support Ticket Demo Model
    Press Create New Model
    Press Add Model To Workspace
    Verify Demo Model Is Created
Input New Label To Trained Model
    Wait Until Page Contains Element  ${click_pre-existing_model}
    Click Element   ${click_pre-existing_model}
    Wait Until Element Is Visible  ${click_text_area2}
    Click Element   ${click_text_area2}
    Input Text   ${click_text_area2}   Forgot Password
    Click Button   ${submit_knapp}

Verify Added Label
    Wait Until Page Contains   95%
    ${verify_categorization}  Get Text   ${category_account}
    Should Be Equal As Strings  ${verify_categorization}   Account
Cleanup
    Go To  https://app.labelf.ai/main/375/models/view
    Verify Demo Model Is Created
    Delete Model

That A Model Is Trained With Support Ticket Data
    Login
    Create Support Ticket Demo Model
A Representative Example From The Dataset Is Input To The Test Your Model
    Input New Label To Trained Model
The Categorization Matches The Label Of The Original Dataset
    Verify Added Label
    Cleanup
