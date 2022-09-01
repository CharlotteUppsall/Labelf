*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/all_resources.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest
*** Test Cases ***
Model Marked As Processing
    [Documentation]  The test will verify that the model is marked as processing right after a dataset has been connected
    Given a dataset has been uploaded
    When the dataset is connected to a model
    Then model shall be in state Processing
A Disconnected Dataset Should Not Be Processing
    Given That A Dataset With Labels Has Been Connected
    When The Dataset Is Disconnected
    Then Model Shall Not Be In State Processing
Verify Model Confidence Level Should Return To Original Value
    Given That A Dataset Has Been Connected And Disconnected Again
    When The Model Processing Is Restarted
    Then The Confidence Levels For An Example Shall Be As Before The Dataset Operation