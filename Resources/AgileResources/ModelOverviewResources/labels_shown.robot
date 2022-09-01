*** Variables ***
${CHOOSE_CUSTOMER_SUPPORT_DATASET_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[1]/div/div/div[2]/button
${TEXT_CHECKBOX}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/div/table/thead/tr[1]/th[1]/i
${CHECKED_CHECKBOX}  check_box
${LABELF_DEMO_DATASET}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/h2
${TRAIN_DIRECTLY_ON_LABELS_FROM_AN_EXISTING_COLUMN}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${CONTINUE_TO_SETUP3}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${CONTINUE_TO_SETUP4}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${FINAL_CREATE_MODEL_BUTTON}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
${OVERVIEW_BUTTON}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${DISMISS_TRAINING_MODEL_BUTTON}  //*[@id="app"]/div[3]/div/div/button
${LABELS_BAR_CHART}   //*[@id="plotly"]/div[1]/div
${LABELS_PIE_CHART}  //*[@id="plotly"]/div[1]/div

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
    Scroll Element Into View  ${LABELF_DEMO_DATASET}
    #ovan: skrolla ner till andra rubriken för att en popup ruta annars skymmer knappen continue
    Wait Until Element Is Visible  ${CHOOSE_CUSTOMER_SUPPORT_DATASET_BUTTON}
    Click Element  ${CHOOSE_CUSTOMER_SUPPORT_DATASET_BUTTON}
    Wait Until Page Contains  Please click on the column containing the text you want to classify

Verify Text Button Is Checked
    Wait Until Element Is Visible  ${TEXT_CHECKBOX}
    ${variable_for_comparison}  Get Text  ${TEXT_CHECKBOX}
    Should Be Equal As Strings  ${variable_for_comparison}  ${CHECKED_CHECKBOX}

Select Train Directly On Labels
    Wait Until Element Is Visible  ${TRAIN_DIRECTLY_ON_LABELS_FROM_AN_EXISTING_COLUMN}
    Click Element At Coordinates  ${TRAIN_DIRECTLY_ON_LABELS_FROM_AN_EXISTING_COLUMN}  5  0
    Scroll Element Into View  ${CONTINUE_TO_SETUP3}
    Click Element  ${CONTINUE_TO_SETUP3}
    Scroll Element Into View  ${CONTINUE_TO_SETUP4}
    Click Element  ${CONTINUE_TO_SETUP4}
    Wait Until Element Is Visible  ${FINAL_CREATE_MODEL_BUTTON}
    Click Element  ${FINAL_CREATE_MODEL_BUTTON}

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
    Click Element  ${OVERVIEW_BUTTON}
    Wait Until Page Contains  300 Rows model
Confirm Labels In Bar Chart
    Scroll Element Into View  ${LABELS_BAR_CHART}
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
    Wait Until Element Is Visible  ${LABELS_PIE_CHART}
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
