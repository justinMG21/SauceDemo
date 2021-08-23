*** Settings ***
Documentation    Contains all the global variables of the project
Resource    Global_Variables.robot
Resource    ../SwagLabs/Resources/Homepage_Variables.robot
Resource    ../SwagLabs/Resources/Login_Keywords.robot
Resource    ../SwagLabs/Resources/Homepage_Keywords.robot
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Navigate To Site
    [Documentation]    Open a browser and navigate to the site
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
End Web Test
    [Documentation]    Closes browser after delay
    Sleep    2s
    Close Browser
Get all the ${listItem}
    @{listElements}      Get WebElements    ${listItem}
    ${listCount}     get length    ${listElements}
    @{listText}     create list
    set suite variable    ${listText}
    FOR     ${item}   IN    @{listElements}
         ${listNames}     get text    ${item}
         Append to list    ${listText}   ${listNames}
    END
    log    ${listText}

User enter username ${username}
    Wait Until Element Is Visible    ${USERNAME_TEXTBOX}
    Input Text    ${USERNAME_TEXTBOX}    ${username}
User enter password ${password}
    Wait Until Element Is Visible    ${PASSWORD_TEXTBOX}
    Input Password    ${PASSWORD_TEXTBOX}    ${password}

User is on the homepage
    Go to   https://www.saucedemo.com/inventory.html
    Wait Until Element Is Visible    ${HOMEPAGE_HEADER_TITLE}
    Wait Until Element Is Visible    ${SORT_DROPDOWN}