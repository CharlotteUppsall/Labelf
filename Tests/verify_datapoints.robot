*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/all_resources.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest
*** Test Cases ***
Verify Number Of Data Points Increased After Adding Additional Dataset
    [Documentation]  Verifies that the number of datapoints has increased after adding another dataset
    [Tags]  datapoints
    Given The User Has A Trained Model
    When The User Connects An Additional Dataset
    Then The Number of Datapoints Displayed Under "My Models" Should Increase

Verify Number Of Data Points Increased After Adding Additional Dataset - 2
    [Documentation]  Verifies that the number of datapoints has increased after adding another dataset - dif 2nd dataset
    [Tags]  datapoints
    Given The User Has A Trained Model - 2
    When The User Connects An Additional Dataset - 2
    Then The Number of Datapoints Displayed Under "My Models" Should Increase - 2


