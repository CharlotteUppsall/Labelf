*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
Start AG-52 Test Suite
    Login
    Create Support Ticket Demo Model
User Can Add A Label To A Trained Customer Support Model Without Example And Verify That It Does Not Work
    [Documentation]
    [Tags]  AG-52 (AG-81)
    Given A Support Ticket Model Is Created
    And The User Is On "Start Training" Page
    When The User Adds A Label Without Example
    Then The Model Should Not Increase "Total Items" And/Or "Labeled Items"

User Can Add A Label To A Trained Customer Support Model With Example And Verify That It Works
    [Documentation]
    [Tags]  AG-52 (AG-82)
    Given A Support Ticket Model Is Created
    And The User Is Already On "Start Training" Page
    When The User Adds A Label With Example
    Then The Model Should Increase "Total Items" And "Labeled Items"

User Can Add Multiple Labels To A Trained Customer Support Model Without Example And Verify That It Does Not Work
    [Documentation]
    [Tags]  AG-52 (AG-83)
    Given A Support Ticket Model Is Created
    And The User Is Already On "Start Training" Page
    When The User Adds Multiple Labels Without Example
    Then The Model Should Not Increase "Total Items" And/Or "Labeled Items"

User Can Add Multiple Labels To A Trained Customer Support Model With Example And Verify That It Works
    [Documentation]
    [Tags]  AG-52 (AG-84)
    Given A Support Ticket Model Is Created
    And The User Is Already On "Start Training" Page
    When The User Adds Multiple Labels With Example
    Then The Model Should Increase "Total Items" And "Labeled Items"

