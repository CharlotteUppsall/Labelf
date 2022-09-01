*** Variables ***
${SLIDE_BUTTON}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
*** Keywords ***
The User Is Logged In
    Verify Login
The User Is Creating A Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Wait Until Element Is Visible  ${SLIDE_BUTTON}
The "Train Directly On Labels From Existing Column" Slider Button Is Pressed
    Click Element At Coordinates  ${SLIDE_BUTTON}  5  0
An Additional Creation Step Should Appear
    Verify Setup
Press Existing Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Wait Until Element Is Visible  ${SLIDE_BUTTON}
    Click Element At Coordinates  ${SLIDE_BUTTON}  5  0
Verify Setup
    Wait Until Page Contains   4
Confirm Setup
    Press Existing Model
    Verify Setup

