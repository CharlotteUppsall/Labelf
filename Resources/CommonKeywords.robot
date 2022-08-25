#Suite Setup    Begin Web Test
#Suite Teardown  End Web Test

# ha dom ovan i denna common filen
*** Settings ***
Resource  variables.robot
Resource  locators.robot
Resource  LocatorsExample.robot


Library  ../Scripts/remove_text.py

*** Keywords ***

Go To Web Page
    Go to  ${}
    Wait Until Page Contains Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[1]