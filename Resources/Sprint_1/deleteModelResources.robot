*** Variables ***
${dropdown_menu}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button
${delete_button}  //*[@id="app"]/div[3]/div/div/div[2]/a
${confirm_delete}  //*[@id="app"]/div[3]/div/div/div[3]/button
${my_models}  //*[@id="app"]/div[6]/div[1]/main/div/div/nav/div/div[1]


*** Keywords ***
Press Dropdown Menu
    Wait Until Page Contains  Models
    Wait Until Page Contains Element  ${dropdown_menu}
    Click Button   ${dropdown_menu}
Press Delete In Dropdown Menu
    Wait Until Page Contains Element  ${delete_button}
    Click Element  ${delete_button}
Press Delete Confirmation Popup
    Wait Until Page Contains Element  ${confirm_delete}
    Click Button  ${confirm_delete}
    
Verify Model Is Deleted
    Wait Until Element Is Visible  ${my_models}
    ${element_text}  Get Text  ${my_models}
    ${actual_amount}  convert into number  ${element_text}
    Should Be True  ${actual_amount} == 0
    
Delete Model
    Press Dropdown Menu
    Press Delete In Dropdown Menu
    Press Delete Confirmation Popup
    Verify Model Is Deleted
