*** Settings ***
Library    SeleniumLibrary
Resource    Homepage_Variables.robot
Resource    ../../Global Resources/Global_Keywords.robot
Resource    ../../Global Resources/Global_Variables.robot
Resource    Homepage_Variables.robot
Resource    Cart_Variables.robot
Library          Collections
Library    Collections
Library    String
Resource    Global_Header_Variables.robot
*** Keywords ***
User is on the cart page
    User is on the homepage
    User wants to add a product to cart
    User clicks the add to cart button
    The product should be added to my cart
User click the continue shopping
    Wait Until Element Is Visible   ${CONTINUE_SHOPPING}
    Click Element   ${CONTINUE_SHOPPING}
User click the checkout button
    Wait Until Element Is Visible   ${CHECKOUT_BUTTON}
    Click Element   ${CHECKOUT_BUTTON}
User is redirected to the checkout page
    Wait Until Element Is Visible      ${FIRSTNAME}
    Wait Until Element Is Visible      ${LASTNAME}
    Wait Until Element Is Visible      ${POSTAL_CODE}
User entered ${FIRSTNAME} ${LASTNAME} and ${POSTAL_CODE}
    Run keyword And Continue On Failure     Input text      ${FIRSTNAME}    Justin
    Run keyword And Continue On Failure     Input text      ${LASTNAME}    Guma
    Run keyword And Continue On Failure     Input text      ${POSTAL_CODE}      12345
    Sleep   2s
User click the continue button
    Wait Until Element Is Visible   ${CONTINUE_BUTTON}
    Click Element   ${CONTINUE_BUTTON}
User will be redirected to the checkout overview
    Wait Until Element Is Visible   ${CHECKOUT_OVERVIEW_HEADER}
    Sleep   2s
User click the finish button
    Wait Until Element Is Visible   ${FINISH_BUTTON}
    Click Element       ${FINISH_BUTTON}
User should see a success message
    Run keyword And Continue On Failure     Page should contain     THANK YOU FOR YOUR ORDER
    Sleep   2s
User click the back home button
    Wait Until Element Is Visible       ${BACK_HOME}
    Click Element       ${BACK_HOME}
User leave the ${userInfo} blank
    Run keyword And Continue On Failure     Textfield Value Should be   ${userInfo}     ${EMPTY}
A ${error} will appear
    Run keyword And Continue On Failure     page should contain     ${error}
User entered firstname
    Run keyword And Continue On Failure     Input text      ${FIRSTNAME}    Justin
User entered lastname
    Run keyword And Continue On Failure     Input text      ${LASTNAME}    Guma