*** Variables ***
${BUTTON_SLIDER}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${BUTTON_SLIDER_OFF}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div/div[1]
*** Keywords ***
The "Train Directly On Labels From Existing Column" Slider Button Has Been Pressed
    Verify Setup
A Creation Step Should Disappear
    Verify Slide Button Is Disabled
Start New Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Wait Until Element Is Visible   ${BUTTON_SLIDER}
Train Directly[...] Function Active To Disabled
   Click Element At Coordinates  ${BUTTON_SLIDER_OFF}  5  0
Verify Slide Button Is Disabled
   Wait Until Page Contains   Name your model
Confirm Text Has Changed When Function Disabled
   Train Directly[...] Function Active To Disabled
   Verify Slide Button Is Disabled
