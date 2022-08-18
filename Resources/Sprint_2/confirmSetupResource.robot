*** Variables ***
${slide_button2}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
# ^ Knappen som heter "Train directly on labels from an existing column" är denne slide-knapp
${password}  123456789

*** Keywords ***

Press Existing Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button  #Det är housing question dataset continue-knappen
    Wait Until Element Is Visible  ${slide_button2}


Press Slide Button
    click element at coordinates  ${slide_button2}  5  0
Verify Setup
    Wait Until Page Contains   4
    #Både den texten som kom fram efter man tryckt slide-knappen och verifiering att det blir ett till steg som nr4

Confirm Setup
    Press Existing Model
    Verify Setup

User Clicks “Train directly on labels From An Existing Column”
    Press Slide Button
The Setup Steps Are Updated To Include A Step To Select Column
    Verify Setup