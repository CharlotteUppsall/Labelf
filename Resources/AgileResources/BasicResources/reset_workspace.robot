*** Keywords ***
Verify Workspace Is Empty
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain  My first workspace
    Run Keyword If  '${status}'=='False'  Go To Workspace
    ${status}=  Run Keyword And Return Status  Verify Model Is Deleted
    Run Keyword If  '${status}'=='False'  Delete Model
    Exit For Loop If  '${status}'=='True'
    END
Go To Workspace
    Click Element  //*[@id="models-button-navbar"]
    Wait Until Page Contains  My Models