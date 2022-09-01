*** Settings ***
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Library  SeleniumLibrary

*** Keywords ***

Log in User
    Input Text  ${MAIL}   marcus.davidsson@iths.se
    Input Text  ${PASSWORD}  vitoKurre2022
    Wait Until Element Is Visible  ${COOKIEDOWN}
    Click Element  ${COOKIEDOWN}
    Click Element   ${LOGINBUTTON}
    Wait Until Page Contains  My first workspace

Navigate dataset
    Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${DATASETMENU}
    Click Element  ${DATASETMENU}
    Wait Until Page Contains Element  ${ADDADATASET+}
    Click Element  ${ADDADATASET+}
    Wait Until Page Contains  Upload a .csv or excel file from my own computer. Make sure its a valid file format.
    Wait Until Page Contains Element  ${SELECT-CSV}
    Click Element  ${SELECT-CSV}
    Wait Until Page Contains  Please add a dataset containing the texts you would like to add. Right now we are supporting csv(Comma Separated Values) files and Excel files.
    Wait Until Page Contains Element  ${DROPZONE}
    Choose file     ${UPLOADFILE}  ${CURDIR}/all_mixed_languages_no_se_en_de_fi_dk_-_Sheet1.csv
    Double Click Element  ${NAMEDATASET}
    Press Keys  ${NAMEDATASET}  CTRL+A+DELETE
    Input Text  ${NAMEDATASET}  Jakob
    Wait Until Page Contains Element  ${UPLOADBUTTON}
    Click Element  ${UPLOADBUTTON}

Data Set Is Created
    Wait Until Page Contains  My Datasets (1)

Delete Dataset
    Wait Until Page Contains Element  ${TREEDOTS}
    Click Element  ${TREEDOTS}
    Wait Until Page Contains Element  ${DELETEDATASET}
    Click Element  ${DELETEDATASET}
    Wait Until Page Contains Element  ${CONFIRMDELETE}
    Click Element  ${CONFIRMDELETE}
    Wait Until Page Contains  Welcome! Let's upload your first dataset!

Navigate to log out
    Wait Until Page Contains Element  ${MODELSMENU}
    Click Element  ${MODELSMENU}
    Wait Until Page Contains Element  ${USERACCOUNTMENU}
    Click Element  ${USERACCOUNTMENU}
    Wait Until Page Contains Element  ${LOGOUTBUTTON}
    Click Element  ${LOGOUTBUTTON}
    Wait Until Page Contains Element  ${DONTHAVEANACCOUNT?}
    ${SAVEDTEXTDONTHAVEANACCOUNT?}  Get Text  ${DONTHAVEANACCOUNT?}
    Log  ${SAVEDTEXTDONTHAVEANACCOUNT?}
    Should Be Equal  DON'T HAVE AN ACCOUNT? SIGN UP  ${SAVEDTEXTDONTHAVEANACCOUNT?}