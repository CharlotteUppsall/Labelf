*** Variables ***
${chooseCustomerSupportDatasetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[1]/div/div/div[2]/button
${text_checkbox}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/div/table/thead/tr[1]/th[1]/i
${checked_checkbox}  check_box
${labelf_demo_dataset}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/h2
${train_directly_on_labels_fram_an_existing_column}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${continue_to_setup3}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${continue_to_setup4}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${final_create_model_button}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${dismiss_training_model_button}  //*[@id="app"]/div[3]/div/div/button
${labels_bar_chart}   //*[@id="plotly"]/div[1]/div
${labels_pie_chart}  //*[@id="plotly"]/div[1]/div

*** Keywords ***
The User Has Created A Model With Existing Labels
    Go Back
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset With Existing Labels Button
    Select Train Directly On Labels
    Confirm Labels In Model View
The User Is On The Overview Page
    Navigate To Model Overview
All Of The Labels From The Dataset Should Be Displayed
    Confirm Labels In Bar Chart
    Scroll Down To Pie Chart
    Confirm Labels In Pie Chart
    Go Back

Press Dataset With Existing Labels Button
    Scroll Element Into View  ${labelf_demo_dataset}
    #ovan: skrolla ner till andra rubriken för att en popup ruta annars skymmer knappen continue
    Wait Until Element Is Visible  ${chooseCustomerSupportDatasetButton}
    Click Element  ${chooseCustomerSupportDatasetButton}
    Wait Until Page Contains  Please click on the column containing the text you want to classify

Verify Text Button Is Checked
    Wait Until Element Is Visible  ${text_checkbox}
    ${variable_for_comparison}  Get Text  ${text_checkbox}
    Should Be Equal As Strings  ${variable_for_comparison}  ${checked_checkbox}

Select Train Directly On Labels
    Wait Until Element Is Visible  ${train_directly_on_labels_fram_an_existing_column}
    Click Element At Coordinates  ${train_directly_on_labels_fram_an_existing_column}  5  0
    Scroll Element Into View  ${continue_to_setup3}
    Click Element  ${continue_to_setup3}
    Scroll Element Into View  ${continue_to_setup4}
    Click Element  ${continue_to_setup4}
    Wait Until Element Is Visible  ${final_create_model_button}
    Click Element  ${final_create_model_button}

Confirm Labels In Model View
#kortvyn över modellen som precis skapats, i kortet listas de egna labels
    Wait Until Page Contains  PAYMENT
    Wait Until Page Contains  ACCOUNT
    Wait Until Page Contains  CONTACT
    Wait Until Page Contains  ORDER
    Wait Until Page Contains  INVOICES
    Wait Until Page Contains  REFUNDS
    Wait Until Page Contains  FEEDBACK
    Wait Until Page Contains  DELIVERY
    Wait Until Page Contains  CANCELLATION_FEE
    Wait Until Page Contains  NEWSLETTER
    Wait Until Page Contains  SHIPPING

Navigate To Model Overview
    Wait Until Page Contains  Models | My first workspace
    Click Element  ${overview_button}
    Wait Until Page Contains  300 Rows model
Confirm Labels In Bar Chart
    Scroll Element Into View  ${labels_bar_chart}
    Wait Until Page Contains  PAYMENT
    Wait Until Page Contains  ACCOUNT
    Wait Until Page Contains  CONTACT
    Wait Until Page Contains  ORDER
    Wait Until Page Contains  INVOICES
    Wait Until Page Contains  REFUNDS
    Wait Until Page Contains  FEEDBACK
    Wait Until Page Contains  DELIVERY
    Wait Until Page Contains  CANCELLATION_FEE
    Wait Until Page Contains  NEWSLETTER
    Wait Until Page Contains  SHIPPING
Scroll Down To Pie Chart
    Sleep  3s
    Execute Javascript  window.scrollTo(0,1700)

Confirm Labels In Pie Chart
    Wait Until Element Is Visible  ${labels_pie_chart}
    Wait Until Page Contains  PAYMENT
    Wait Until Page Contains  ACCOUNT
    Wait Until Page Contains  CONTACT
    Wait Until Page Contains  ORDER
    Wait Until Page Contains  INVOICES
    Wait Until Page Contains  REFUNDS
    Wait Until Page Contains  FEEDBACK
    Wait Until Page Contains  DELIVERY
    Wait Until Page Contains  CANCELLATION_FEE
    Wait Until Page Contains  NEWSLETTER
    Wait Until Page Contains  SHIPPING
