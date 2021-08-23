*** Settings ***
Library    SeleniumLibrary
Resource    Homepage_Variables.robot
Resource    ../../Global Resources/Global_Keywords.robot
Resource    ../../Global Resources/Global_Variables.robot
Resource    Global_Header_Variables.robot
Resource    Login_Keywords.robot
Resource    Homepage_Keywords.robot
Resource    Homepage_Variables.robot
*** Keywords ***
User click the burger menu
    Click element   ${BURGER_MENU}
    Sleep   2s
User should see the sidebar menu ${ALL_ITEMS} ${ABOUT} ${LOGOUT} ${RESET_APP_STATE}
    Wait Until Element Is Visible   ${ALL_ITEMS}
    Wait Until Element Is Visible   ${ABOUT}
    Wait Until Element Is Visible   ${LOGOUT}
    Wait Until Element Is Visible   ${RESET_APP_STATE}

User select on the menu ${sideMenu}
    Click Element   ${sideMenu}
User should be able to see all the items
    ${activeURL}    Get Location
    Run keyword And Continue On Failure     Should be equal    ${activeURL}     https://www.saucedemo.com/inventory.html
User should be redirected to the saucelabs site
    ${activeURL}    Get Location
    Run keyword And Continue On Failure     Should be equal     ${activeURL}        https://saucelabs.com/
user should be logout and will be redirected to the login page
    That the user is on the login page
Refresh the page
    Execute Javascript    window.location.reload(true);
    Wait Until Element Is Visible   ${HOMEPAGE_HEADER_TITLE}
The application will return to its default state
    The product should no longer on the cart
    Go to   https://www.saucedemo.com/inventory.html
