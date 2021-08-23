*** Settings ***
Library    SeleniumLibrary

Resource    ../../Global Resources/Global_Keywords.robot
Resource    ../../Global Resources/Global_Variables.robot
Resource    Homepage_Variables.robot
Resource    Login_Variables.robot


*** Keywords ***
That the user is on the login page
    Title Should Be    Swag Labs
    ${activeURL}    Get Location
    Should Be Equal    ${activeURL}    ${URL}
    Wait Until Element Is Visible    ${LOGIN_LOGO}
    Wait Until Element Is Visible    ${USERNAME_TEXTBOX}
    Wait Until Element Is Visible    ${PASSWORD_TEXTBOX}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
That the error message is visible
    Wait Until Element Is Visible    ${ERROR_MESSAGE_CONTAINER}
User click the login button
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}
An error message will appear
    [Arguments]    ${errorMessage}
    Wait Until Element Is Visible    ${ERROR_MESSAGE_TEXT}
    Element Should Contain    ${ERROR_MESSAGE_TEXT}     ${errorMessage}
User closed error message
    [Arguments]          ${username}    ${password}    ${errorMessage}
    That the user is on the login page
    Input Text    ${USERNAME_TEXTBOX}    ${username}
    Input Password    ${PASSWORD_TEXTBOX}    ${password}
    Click Element    ${LOGIN_BUTTON}
    Element Should Contain    ${ERROR_MESSAGE_TEXT}     ${errorMessage}
    Click Element    ${ERROR_MESSAGE_CLOSE_BUTTON}
    Element Should Not Be Visible    ${USERNAME_REQUIRED_ERROR_MESSAGE}
    Element Should Not Be Visible    ${USERNAME_PASSWORD_REQUIRED}
    Element Should Not Be Visible    ${PASSWORD_REQUIRED_ERROR_MESSAGE}
