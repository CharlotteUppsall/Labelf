*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
#Suite Setup    Begin Web Test
#Suite Teardown  End Web Test


*** Keywords ***
Select A Workspace
    Go To  https://stag.labelf.ai/main/84/datasets/view
    Wait Until Page Contains Element  //*[@id="hamburger-menu-button"]/div/i   #WORKSPACE_MENU
    Click Element   //*[@id="hamburger-menu-button"]/div/i  #WORKSPACE_MENU
#    Sleep  1s
    Scroll Element Into View  //*[@id="app"]/div[1]/div/div[2]/div[3]/a/div[1]/div    #${SWITCH_TO_THIS_WORKSPACE}
    #Wait Until Page Contains Element  //*[@id="app"]/div[1]/div/div[2]/div[3]/a/div[1]/div   #${SWITCH_TO_THIS_WORKSPACE}
    Click Element  //*[@id="app"]/div[1]/div/div[2]/div[3]/a/div[1]/div   #${SWITCH_TO_THIS_WORKSPACE}
    Reload Page
    Wait Until Page Contains  Models | My first workspace
    Wait Until Location Is  https://stag.labelf.ai/main/84/models/view


*** Test Cases ***
Logged in user can choose between multiple worspaces to work in 
    Given user is logged in
    And the user navigates to another random page 
    When the user clicks on the workspace menu
    Then the user can select which workspace to navigate to 
