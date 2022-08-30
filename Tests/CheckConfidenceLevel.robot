*** Settings ***

Documentation  Testsuite Login
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Resource  ../Resources/ConfidenceLevelKeywords.robot

Library  ../Scripts/remove_text.py
Library  SeleniumLibrary
Library  String


Suite Setup  Start WebTest
Suite Teardown  End WebTest


*** Test Cases ***
Verify the categorization confidence levels matches the labeling with first dataset.
    [Documentation]  This testcase to Verify the categorization confidence levels matches the labeling with first dataset
    [Tags]  TC Confidence level match with 1st dataset
    Given Navigate To Workspace 387
          User Navigate To Model Overview App 4
    When User Inputs an example from the first dataset to the test the model
    Then Confidence levels matches the label of the original datapoint
