*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User can add a label to a trained customer suppport model and verify that it works
    [Documentation]  Add label and confirm/verify them to a pre-existing trained model
    [Tags]  AG_51 (AG-69, AG-70, AG-71)
    Given That A Model Is Trained With Support Ticket Data
    When A Representative Example From The Dataset Is Input To The Test Your Model
    Then The Categorization Matches The Label Of The Original Dataset