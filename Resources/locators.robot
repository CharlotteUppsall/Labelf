*** Variables ***

#Login Page
${login_email_field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input
${login_password_field}  xpath:/html/body/div[1]/div/div/main/div/div/div/div/div/div[1]/form/div[2]/div[2]/div[1]/div/input
${login_button}  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
${diffuse_cookie_button}  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]

#Models Overview Page
${WorkspaceDropdownMenu}  //*[@class="v-btn v-btn--flat v-btn--large theme--light"]