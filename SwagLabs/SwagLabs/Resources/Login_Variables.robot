*** Settings ***

*** Variables ***
${LOGIN_LOGO}                         //div[@class='login_logo']
${USERNAME_TEXTBOX}                   //input[@data-test="username"]
${PASSWORD_TEXTBOX}                   //input[@data-test="password"]
${LOGIN_BUTTON}                       //input[@data-test="login-button"]
${USERNAME_REQUIRED_ERROR_MESSAGE}    //*[contains(text(),'Epic sadface: Username is required')]
${PASSWORD_REQUIRED_ERROR_MESSAGE}    //*[contains(text(),'Epic sadface: Password is required')]
${USERNAME_PASSWORD_REQUIRED}         //*[contains(text(),'Epic sadface: Username and password do not match any user in this service')]
${ERROR_MESSAGE_CLOSE_BUTTON}         //button[@class="error-button"]
${ERROR_MESSAGE_CONTAINER}            //h3[@data-test="error"]/parent::div
${ERROR_MESSAGE_TEXT}                 //h3[@data-test="error"]