*** Settings ***
Library    SeleniumLibrary
Resource    Homepage_Variables.robot
Resource    ../../Global Resources/Global_Keywords.robot
Resource    ../../Global Resources/Global_Variables.robot

Library          Collections
Library    Collections
Library    String
Resource    Global_Header_Variables.robot
Resource    Login_Keywords.robot
Resource    ../../Global Resources/Global_Keywords.robot
Resource    ../../Global Resources/Global_Variables.robot
Resource    Cart_Keywords.robot
Resource    Cart_Variables.robot
*** Keywords ***
User is redirected to the homepage
    Wait Until Element Is Visible    ${HOMEPAGE_HEADER_TITLE}
    Wait Until Element Is Visible    ${SORT_DROPDOWN}
#User is on the homepage
#    [Arguments]    ${userName}      ${secretPassword}
#    That the user is on the login page
#    User enter a ${userName}
#    User enter a ${secretPassword}
#    User click the login button
#    Wait Until Element Is Visible    ${HOMEPAGE_HEADER_TITLE}
#    Wait Until Element Is Visible    ${SORT_DROPDOWN}
User click on the sort dropdown
    page should contain element    ${SORT_DROPDOWN}
    click element    ${SORT_DROPDOWN}
User should see the sorting options
    @{sortOptionsElements}  get list items    ${SORT_DROPDOWN}
    set suite variable  @{sortOptionsElements}
    log    ${sortOptionsElements}
    should be equal    ${sortOptionsElements}[0]   Name (A to Z)
    should be equal    ${sortOptionsElements}[1]   Name (Z to A)
    should be equal    ${sortOptionsElements}[2]   Price (low to high)
    should be equal    ${sortOptionsElements}[3]   Price (high to low)



Sort in Ascending Order
    [Documentation]    Ascending Order Sort
    [Arguments]  ${inputList}     ${alphabet}=${SPACE}_0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz
    ${ns}    Create Dictionary    alphabet=${alphabet}    input_list=${inputList}
    ${sorted}    Evaluate
    ...    sorted(input_list, key=lambda word: [alphabet.index(c) if c in alphabet else ord(c) for c in word])
    ...    namespace=${ns}
    [Return]    ${sorted}

Sort in Descending Order
    [Documentation]    Descending Order Sort
    [Arguments]    ${inputList}
    ${alphabetDescending}    Set Variable    zZyYxXwWvVuUtTsSrRqQpPoOnNmMlLkKjJiIhHgGfFeEdDcCbBaA9876543210_${SPACE}
    ${sorted_in_descending}    Sort In Ascending Order    ${inputList}    ${alphabetDescending}
    [Return]    ${sorted_in_descending}
User select sort ${sortOption}
    select from list by label    ${SORT_DROPDOWN}    ${sortOption}
    Run keyword And Continue On Failure     List Selection Should Be     ${SORT_DROPDOWN}     ${sortOption}
    Sleep    3s
Products should be sorted from A to Z
    Get all the ${PRODUCTS_NAMES}
    ${final_sorted_list}    Sort in Ascending Order    ${listText}
    Run keyword And Continue On Failure     lists should be equal    ${final_sorted_list}         ${listText}
    log     ${final_sorted_list}
    log     ${listText}
Products should be sorted from Z to A
    Get all the ${PRODUCTS_NAMES}
    ${final_sorted_list}    Sort in Descending Order    ${listText}
    Run keyword And Continue On Failure     lists should be equal    ${final_sorted_list}         ${listText}
    log     ${final_sorted_list}
    log     ${listText}
Convert Prices to Number
    Get all the ${PRODUCTS_PRICE}
    ${sorted_list}    Copy List   ${listText}
    ${noCurrency}   Create List
    FOR     ${item}    IN   @{sorted_list}
        ${price}    Remove String   ${item}     ,    $
        ${convertPriceToInt}     Convert to Number    ${price}
        Append to List      ${noCurrency}       ${convertPriceToInt}
    END
    Set Test Variable   ${noCurrency}
    log     ${noCurrency}
Ascending Sort Float Numbers ${numbers}
    ${sorted}   Evaluate    sorted(${numbers}, key=int, reverse=False)
    ${returnedAscNumbers}      Copy List      ${numbers}
    Set Test Variable      ${returnedAscNumbers}
Descending Sort Float Numbers ${numbers}
    ${sorted}   Evaluate    sorted(${numbers}, key=int, reverse=True)
    ${returnedDescNumbers}      Copy List      ${numbers}
    Set Test Variable      ${returnedDescNumbers}
Products should be sorted from price low to high
    Convert Prices to Number
    Ascending Sort Float Numbers ${noCurrency}
    Run keyword And Continue On Failure     lists should be equal    ${returnedAscNumbers}     ${noCurrency}
    log     ${returnedAscNumbers}
    log     ${noCurrency}
Products should be sorted from price high to low
    Convert Prices to Number
    Descending Sort Float Numbers ${noCurrency}
    Run keyword And Continue On Failure     lists should be equal    ${returnedDescNumbers}     ${noCurrency}
    log     ${returnedDescNumbers}
    log     ${noCurrency}

User wants to add a product to cart
    Get all the ${PRODUCTS_NAMES}
    ${firstProductName}     Get From List    ${listText}    0
    Set Suite Variable      ${firstProductName}
User clicks the add to cart button
    Click Element   ${FIRST_ADD_TO_CART}
The add to cart button will changed to remove button
    Run keyword And Continue On Failure     Wait Until Element Is Visible      ${FIRST_REMOVE_BUTTON}
The product should be added to my cart
    Wait Until Element Is Visible       ${CART_ICON}
    Click Element   ${CART_ICON}
    Run keyword And Continue On Failure     Page Should Contain     ${firstProductName}
    Sleep   2s
User wants to remove the product from the cart
    User wants to add a product to cart
    User clicks the add to cart button
    Sleep   2s
    The add to cart button will changed to remove button
    Sleep   2s
    The product should be added to my cart
    Click Element   ${CONTINUE_SHOPPING}
User click the remove button
    Run keyword And Continue On Failure     Click Element   ${FIRST_REMOVE_BUTTON}
The remove button will changed to add to cart button
    Wait Until Element Is Visible       ${FIRST_ADD_TO_CART}
The product should no longer on the cart
    Wait Until Element Is Visible       ${CART_ICON}
    Click Element   ${CART_ICON}
    Run keyword And Continue On Failure     Page Should Not Contain     ${firstProductName}
    Sleep   2s