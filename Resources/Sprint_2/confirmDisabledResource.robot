*** Variables ***
${button_slider}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${button_slider_off}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div/div[1]
${password}  123456789
${Main_Page}

*** Keywords ***
Start New Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Wait Until Element Is Visible   ${button_slider}

Train Directly[...] Function Active To Disabled

   Click Element At Coordinates  ${button_slider_off}  5  0

Verify Slide Button Is Disabled
   Wait Until Page Contains   Name your model

Confirm Text Has Changed When Function Disabled

   Train Directly[...] Function Active To Disabled
   Verify Slide Button Is Disabled

That “Train directly on labels from an existing column” Has Been Selected
    Wait Until Page Contains  Please click on the column containing the text you want to classify
The Slider Is Set To Disabled
    Train Directly[...] Function Active To Disabled
The Column Select Step Shall Be Removed From The Setup Steps
    Verify Slide Button Is Disabled
    Go Back