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

