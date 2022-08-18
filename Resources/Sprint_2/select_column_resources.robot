*** Variables ***
${e_mail_stag}  joakim.sorkka@iths.se
${password_stag}  123456789
${checkbox_should_be}  check_box
${choose_dataset_untrained_model}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${choose_dataset_cultural_centers}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[3]/div/div/div[2]/button
${choose_dataset_customer_support}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[1]/div/div/div[2]/button
${choose_dataset_no_labels}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[4]/div/div/div[2]/button
${label_switch}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${continue_button2}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${intent_checkbox}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[2]
${category_checkbox}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[1]
${category_checkbox_one_choice}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th/i
${exit_button}  //*[@id="app"]/div[2]/div/div/nav/div/a/div
*** Keywords ***
Choose Dataset
    # Chooses the dataset named "Untrained Model"
    Wait Until Element Is Visible  ${choose_dataset_untrained_model}
    Scroll Element Into View  ${choosedatasetbutton}
    Click Element At Coordinates  ${choose_dataset_untrained_model}  10  0
    Wait Until Page Contains  Please click on the column containing the text you want to classify
Choose Dataset2
    # Chooses the dataset named "Cultural Centers Survey"
    Wait Until Element Is Visible  ${choose_dataset_cultural_centers}
    Scroll Element Into View  ${choosedatasetbutton}
    Click Element  ${choose_dataset_cultural_centers}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
Choose Dataset3
    # Chooses the dataset named "Customer Support"
    Wait Until Element Is Visible  ${choose_dataset_customer_support}
    Scroll Element Into View  ${choosedatasetbutton}
    Click Element  ${choose_dataset_customer_support}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
Choose Dataset4
    # Chooses the dataset named "rows with no labels"
    Wait Until Element Is Visible  ${choose_dataset_no_labels}
    Scroll Element Into View  ${choosedatasetbutton}
    Click Element  ${choose_dataset_no_labels}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
Enable Train Directly On Labels
    Wait Until Element Is Visible  ${label_switch}
    Click Element  ${label_switch}
Verify Train Directly On Labels Is Enabled
    Wait Until Page Contains  Select the column which contains the labels
Press Continue
    Wait Until Element Is Visible  ${continue_button2}
    Click Element  ${continue_button2}
    Verify Continue Is Pressed
Verify Continue Is Pressed
    Wait Until Page Contains  Please click on the column containing the labels
Press Intent Checkbox
    Wait Until Element is Visible  ${intent_checkbox}
    Click Element  ${intent_checkbox}
Press Category Checkbox
    Wait Until Element is Visible  ${category_checkbox}
    Click Element  ${category_checkbox}
Verify Category Button Is Checked
# Compares if expected string taken from xpath matches actual string when category button is checked.
    ${check_box1}  Get Text  ${category_checkbox}/i
    Should Be Equal As Strings  ${check_box1}  ${checkbox_should_be}
Verify Intent Button Is Checked
# Compares if expected string taken from xpath matches actual string when intent button is checked.
    ${check_box2}  Get Text  ${intent_checkbox}/i
    Should Be Equal As Strings  ${check_box2}  ${checkbox_should_be}
Verify Category Button Is Checked No Choice
# Compares if expected string matches actual string when there is no choice and button is automatically checked.
    Wait Until Element Is Visible  ${category_checkbox_one_choice}
    ${check_box3}  Get Text  ${category_checkbox_one_choice}
    Should Be Equal As Strings  ${check_box3}  ${checkbox_should_be}
Exit Model Creation
    Click Element  ${exit_button}
    Verify Model Creation Exit
Verify Model Creation Exit
    Wait Until Page Contains  Agile Peacock
A Dataset With Existing Labels Has Been Selected
    Press Create New Model
    Press Continue To Model Creation
    Choose Dataset
"Train Directly On Labels From An Existing Column" Has Been Enabled
    Enable Train Directly On Labels
    Verify Train Directly On Labels Is Enabled
    Sleep  2s
The User Clicks Continue
    Press Continue
It Shall Be Possible To Select A Column Which Contains The Labels
    Press Intent Checkbox
    Verify Intent Button Is Checked
    Press Category Checkbox
    Verify Category Button Is Checked
    Exit Model Creation
The Column That Contains The Labels Has Been Selected
    Verify Category Button Is Checked No Choice
    Exit Model Creation
A Dataset With Existing Labels Has Been Selected - Dataset 2
    Press Create New Model
    Press Continue To Model Creation
    Choose Dataset2
A Dataset With Existing Labels Has Been Selected - Dataset 3
    Press Create New Model
    Press Continue To Model Creation
    Choose Dataset3
A Dataset With Existing Labels Has Been Selected - Dataset 4
    Press Create New Model
    Press Continue To Model Creation
    Choose Dataset4
