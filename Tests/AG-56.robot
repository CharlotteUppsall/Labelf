*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Verify "Connect Additional Dataset" Button On Model Overview
    [Documentation]  Test verifies that the "Connect Additional Dataset"-button is present in the model overview page
    [Tags]  AG_56   AG-88
    Given A Model Has Been Created
    When The Model Overview Page Is Opened
    Then Connect Additional Datasets Button Shall Be Shown

Datasets Available To Connect Are Displayed For The User
    [Documentation]  Test verifies uploaded datasets are present in the "My Datsets" list
    [Tags]  AG_56  AG_89
    Given A Dataset Is Uploaded
    And The Dataset Isn't Connected To The Model
    And User Is On The Model Overview Page
    When User Clicks On The "Connect Additional Dataset"-Button
    Then The Dataset Is Displayed In The "My Datasets"-List

Connected Datasets Are Displayed In A List For The User
    [Documentation]  The connected dataset should be listed under Connected datasets on the model overview
    [Tags]  AG_56  AG_91
    Given The User Is On The “Datasets Available To Connect” Page
    And The Continue Button For A Dataset Is Clicked
    When User Clicks On The Connect Button
    Then The Dataset Is Listed Under Connected Datasets On The Model Overview
