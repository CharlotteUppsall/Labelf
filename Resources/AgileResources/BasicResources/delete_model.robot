*** Variables ***
${DROPDOWN_MENU}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button
${DELETE_BUTTON}  //*[@id="delete-button"]
${CONFIRM_DELETE}  //*[@id="app"]/div[6]/div/div/div[3]/button
${MY_MODELS}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav/div/div[1]
*** Keywords ***
Press Dropdown Menu
    Wait Until Page Contains  Models
    Reload Page
    Wait Until Page Contains  Models
    Wait Until Page Contains Element  ${DROPDOWN_MENU}
    Click Button   ${DROPDOWN_MENU}
Press Delete In Dropdown Menu
    Wait Until Page Contains Element  ${DELETE_BUTTON}
    Click Element  ${DELETE_BUTTON}
Press Delete Confirmation Popup
    Wait Until Page Contains Element  ${CONFIRM_DELETE}
    Click Button  ${CONFIRM_DELETE}
Verify Model Is Deleted
    Wait Until Element Is Visible  ${MY_MODELS}
    ${element_text}  Get Text  ${MY_MODELS}
    ${actual_amount}   remove_text  ${element_text}
    Should Be True  ${actual_amount} == 0

Delete Model
    Press Dropdown Menu
    Press Delete In Dropdown Menu
    Press Delete Confirmation Popup
    Verify Model Is Deleted
