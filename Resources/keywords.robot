*** Keywords ***
End Model Creation Test
    Delete Single Automated Test Model
    Close Browser

User Navigate/Login To App and Navigates To Workspace 387
    Navigate to Workspace 387
    Input User Credential
    Confirm Cookie
    Press Login Button
    Confirm User Logged In
    Wait Until Page Contains  Models | Team Kimchi
    
User Is Logged In And On An Empty Workspace
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (0)

Delete Single Automated Test Model
    User Is Logged In And On An Workspace Containing One Model
    User Opens Single Model Options Dropdown List
    User Clicks Delete Model Option
    Workspace Is Empty

User Is Logged In And On An Workspace Containing One Model
    Go To  ${StagWorkspaceModelView}
    Wait Until Page Contains  My Models (1)

User Opens Single Model Options Dropdown List
    Wait Until Page Contains Element  ${SingleModelOptionsButton}
    Click Element  ${SingleModelOptionsButton}

Workspace Is Empty
    Wait Until Page Contains  My Models (0)

User Clicks Delete Model Option
    Wait Until Page Contains Element  ${DeleteOption}
    Click Element  ${DeleteOption}
    Wait Until Page Contains Element  ${DeleteButton}
    Click Button  ${DeleteButton}


