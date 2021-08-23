*** Settings ***
Library    SeleniumLibrary
Resource    ../Global Resources/Global_Keywords.robot
Resource    ../Global Resources/Global_Variables.robot

Resource    Resources/Login_Variables.robot
Resource    Resources/Login_Keywords.robot
Resource    Resources/Global_Header_Keywords.robot
Resource    Resources/Global_Header_Variables.robot
Resource    Resources/Login_Keywords.robot
Resource    Resources/Cart_Keywords.robot
Resource    Resources/Cart_Variables.robot
Resource    Resources/Product_Feature_Page_Keywords.robot
Library          Collections
Library    Collections
Library    String



Test Setup    Navigate To Site
Test Teardown    End Web Test
Test Template    Standard Problem Performance Glitch Users


*** Test Cases ***

Verify Sauce Demo using standard user                                ${STANDARD_USER}              ${SECRET_SAUCE}
Verify Sauce Demo using problem user                                 ${PROBLEM_USER}               ${SECRET_SAUCE}
Verify Sauce Demo using performance glitch user                      ${PERFORMANCE_GLITCH_USER}    ${SECRET_SAUCE}

*** Keywords ***
Standard Problem Performance Glitch Users
    [Arguments]     ${username}     ${password}
    # Login
    User entered valid ${username} and ${password}
    # Homepage
    User should be able to sort the sort options
    User should be able to sort the products by name A to Z
    User should be able to sort the products by name Z to A
    User should be able to sort the products by name low to high
    User should be able to sort the products by name high to low
    User should be able to add product to cart while on the homepage
    User should be able to remove product from cart while on the homepage
    User should be able to navigate to the product feature page
    User should be able to add product to cart while on the product feature page
    User should be able to remove product from cart while on the product feature page
    # Cart
    User should be able to remove product from the cart while on the cart page
    User should not be able to checkout if users firstname has not been provided
    User should not be able to checkout if users lastname has not been provided
    User should not be able to checkout if users postal code has not been provided
    User should be able to checkout
    # Global Header
    User should be see side bar menu
    User should be able to select all items menu
    User should be able to select about menu
    User should be able to reset app state
    User should be able to logout
User entered valid ${username} and ${password}
    Given That the user is on the login page
    And User enter username ${username}
    And User enter password ${password}
    When User click the login button
User should be able to sort the sort options
    [Documentation]     Check if sort dropdown contains all the options
    Given User is on the homepage
    When User click on the sort dropdown
    Then User should see the sorting options
User should be able to sort the products by name A to Z
    [Documentation]     Check if products can be sorted from A to Z
    Given User is on the homepage
    And User click on the sort dropdown
    When User select sort ${A_TO_Z}
    Then Products should be sorted from A to Z
User should be able to sort the products by name Z to A
    [Documentation]     Check if products can be sorted from Z to A
    Given User is on the homepage
    And User click on the sort dropdown
    When User select sort ${Z_TO_A}
    Then Products should be sorted from Z to A
User should be able to sort the products by name low to high
    [Documentation]    Check if products can be sorted to low to high
    Given User is on the homepage
    And User click on the sort dropdown
    When User select sort ${LOW_TO_HIGH}
    Then Products should be sorted from price low to high
User should be able to sort the products by name high to low
    [Documentation]    Check if products can be sorted to high to high
    Given User is on the homepage
    And User click on the sort dropdown
    When User select sort ${HIGH_TO_LOW}
    Then Products should be sorted from price high to low
User should be able to add product to cart while on the homepage
    [Documentation]     Check if the product can be added to the cart while user is on the homepage
    Given User is on the homepage
    And User wants to add a product to cart
    When User clicks the add to cart button
    Then The add to cart button will changed to remove button
    And The product should be added to my cart
    And User click the continue shopping
User should be able to remove product from cart while on the homepage
    [Documentation]     Check if the product that was added to the cart can be remove while user is on the homepage
    Given User is on the homepage
    When User click the remove button
    Then The remove button will changed to add to cart button
    And The product should no longer on the cart
    And User click the continue shopping
# Product Feature Page
User should be able to navigate to the product feature page
    [Documentation]     Check if the user can access the product feature page
    Given User is on the homepage
    When User click a product
    Then User should be redirected to the product feature page
    And User click back to product button
User should be able to add product to cart while on the product feature page
    [Documentation]     Check if the product can be added to the cart while user is on the product feature page
    Given User is on the product feature page
    When User clicks the add to cart button
    Then The add to cart button will changed to remove button
    And The product should be added to my cart
    And User click the continue shopping
User should be able to remove product from cart while on the product feature page
    [Documentation]     Check if the product that was added to the cart can be remove while user is on the product feature page
    Given User is on the product feature page
    When User click the remove button
    Then The remove button will changed to add to cart button
    And The product should no longer on the cart
    And User click the continue shopping

# Cart
User should be able to remove product from the cart while on the cart page
    [Documentation]     Check if the product that was added to the cart can be remove while user is on the cart page
    Given User is on the cart page
    When User click the remove button
    Then The product should no longer on the cart
    And User click the continue shopping

User should not be able to checkout if users firstname has not been provided
    [Documentation]     Check if an error will appear if user proceed to checkout while first name is empty
    Given User is on the cart page
    And User click the checkout button
    And User is redirected to the checkout page
    And User leave the ${FIRSTNAME} blank
    When User click the continue button
    Then A ${FIRSTNAME_REQUIRED} will appear
User should not be able to checkout if users lastname has not been provided
    [Documentation]     Check if an error will appear if user proceed to checkout while last name is empty
    Given User is on the cart page
    And User click the checkout button
    And User is redirected to the checkout page
    And User entered firstname
    And User leave the ${LASTNAME} blank
    When User click the continue button
    Then A ${LASTNAME_REQUIRED} will appear

User should not be able to checkout if users postal code has not been provided
    [Documentation]     Check if an error will appear if user proceed to checkout while postal code is empty

    Given User is on the cart page
    And User click the checkout button
    And User is redirected to the checkout page
    And User entered firstname
    And User entered lastname
    And User leave the ${POSTAL_CODE} blank
    When User click the continue button
    Then A ${POSTAL_CODE_REQUIRED} will appear

User should be able to checkout
    [Documentation]     Check if the products that are added to the cart can be checkout by the user
    Given User is on the cart page
    And User click the checkout button
    And User is redirected to the checkout page
    And User entered ${FIRSTNAME} ${LASTNAME} and ${POSTAL_CODE}
    When User click the continue button
    Then User will be redirected to the checkout overview
    When User click the finish button
    Then User should see a success message
    And User click the back home button

# Global Header
User should be see side bar menu
    [Tags]  Header
    Given User is on the homepage
    When User click the burger menu
    Then User should see the sidebar menu ${ALL_ITEMS} ${ABOUT} ${LOGOUT} ${RESET_APP_STATE}
User should be able to select all items menu
    [Tags]  Header
    Given User is on the homepage
    And User click the burger menu
    When User select on the menu ${ALL_ITEMS}
    Then User should be able to see all the items
User should be able to select about menu
    [Tags]  Header
    Given User is on the homepage
    And User click the burger menu
    When User select on the menu ${ABOUT}
    Then User should be redirected to the saucelabs site
User should be able to logout
    [Tags]  Header
    Given User is on the homepage
    And User click the burger menu
    When User select on the menu ${LOGOUT}
    Then user should be logout and will be redirected to the login page
User should be able to reset app state
    [Tags]  Header
    Given User is on the homepage
    And User wants to add a product to cart
    And User clicks the add to cart button
    Then The add to cart button will changed to remove button
    And User click the burger menu
    When User select on the menu ${RESET_APP_STATE}
    And Refresh the page
    Then The application will return to its default state