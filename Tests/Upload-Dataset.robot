*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/KattugglaDatasetKeywoeds.robot
Resource  ../PageObjects/locators.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Can Upload a Dataset
    [Documentation]  Once user is logd in; user is avalibal to add a dataset
    [Tags]  Upload Dataset

    Given User Is Logged In
    When Navigate dataset
    Then Data Set Is Created