*** Settings ***
Library    SeleniumLibrary
Resource    Homepage_Variables.robot
Resource    ../../Global Resources/Global_Keywords.robot
Resource    ../../Global Resources/Global_Variables.robot
Resource    Homepage_Variables.robot
Resource    Cart_Keywords.robot
Resource    Product_Feature_Page_Variables.robot
Library          Collections
Library    Collections
Library    String
Resource    Global_Header_Variables.robot
*** Keywords ***
User click a product
    Get all the ${PRODUCTS_NAMES}
    ${firstProductName}     Get From List    ${listText}    0
    Set Suite Variable      ${firstProductName}
    Wait Until Element Is Visible   ${FIRST_PRODUCT_IMAGE}
    Click Element   ${FIRST_PRODUCT_IMAGE}
    Sleep   2s
User should be redirected to the product feature page
    Run keyword And Continue On Failure     Page Should Contain     ${firstProductName}
User is on the product feature page
    User is on the homepage
    User wants to add a product to cart
    User click a product
    User should be redirected to the product feature page
User click back to product button
    Wait Until Element Is Visible   ${BACK_TO_PRODUCTS_BUTTON}
    Click Element   ${BACK_TO_PRODUCTS_BUTTON}