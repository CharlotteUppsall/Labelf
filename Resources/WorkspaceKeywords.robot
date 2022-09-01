*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  ../Scripts/remove_text.py

*** Keywords ***


#Select A Workspace
user navigates to another random page
    Go To  https://stag.labelf.ai/main/84/datasets/view
user clicks on the workspace menu
    Wait Until Page Contains Element  ${WORKSPACE_MENU}
    Click Element   ${WORKSPACE_MENU}
user can select which workspace to navigate to
    Scroll Element Into View  ${SWITCH_TO_THIS_WORKSPACE}
    Click Element  ${SWITCH_TO_THIS_WORKSPACE}
    Reload Page
    Wait Until Page Contains  Models | My first workspace
    Wait Until Location Is  https://stag.labelf.ai/main/84/models/view


#workspace settings are shown
#    Wait Until Page Contains   Workspace Settings
#    Wait Until Page Contains   Shared
#    Wait Until Page Contains   Users
#    Wait Until Page Contains   API
#    Wait Until Page Contains   Billing
#    Wait Until Page Contains   Integration

user clicks on each of the workspace settings
    Scroll Element Into View   //*[@id="app"]/div[1]/div/div[1]/div[6]/a/div[1]/div  #shared
    Click Element    //*[@id="app"]/div[1]/div/div[1]/div[6]/a/div[1]/div   #shared
    Wait Until Location Is   https://stag.labelf.ai/main/84/settings/shared
    Click Element   //*[@id="app"]/div[5]/div/div[1]/div[7]/a/div[1]/div  #users
    Wait Until Location Is   https://stag.labelf.ai/main/84/settings/users
    Click Element   //*[@id="app"]/div[7]/div/div[1]/div[8]/a/div[1]/div   #api
    Wait Until Location Is  https://stag.labelf.ai/main/84/settings/api
    Click Element   //*[@id="app"]/div[3]/div/div[1]/div[9]/a/div[1]/div   #Billing
    Wait Until Location Is   https://stag.labelf.ai/main/84/settings/billing
    Click Element     //*[@id="app"]/div[8]/div/div[1]/div[10]/a/div[1]/div  #integration


user is navigated to the correlating page
    Wait Until Location Is  https://stag.labelf.ai/main/84/authorizations

user is on labelf website
    Go To   https://stag.labelf.ai/main/84/models/view

each of the workspace menu titles are shown
    Wait Until Page Contains   Current Workspace:
    Wait Until Page Contains   Models
    Wait Until Page Contains   Datasets
    Wait Until Page Contains   Workspace Settings
    Wait Until Page Contains   Shared
    Wait Until Page Contains   Users
    Wait Until Page Contains   API
    Wait Until Page Contains   Billing
    Wait Until Page Contains   Integration
    Wait Until Page Contains   Switch Workspace
    Wait Until Page Contains   Create workspace

