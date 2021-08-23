*** Settings ***
Documentation    Contains all the test cases of the login page
Library     SeleniumLibrary
Library      ExcelLibrary
Library    DataDriver    ../Test Data/LoginValidationTestData.xlsx    sheet_name=LoginErrorMessages

Resource    ../Global Resources/Global_Keywords.robot
Resource    ../Global Resources/Global_Variables.robot
Resource    Resources/Login_Variables.robot
Resource    Resources/Login_Keywords.robot
Resource    SwagLabsUsers.robot

Test Setup    Navigate To Site
Test Teardown    End Web Test
Test Template    User entered invalid login scenarios

*** Test Cases ***
# This test case will check all the error messages in the login page
# Credentials and the expected error messages are saved on an excel file
# Using data driven approach I manage to use only one keyword that can check different scenarios
User should not be able to login with invalid credentials    ${username}    ${password}    ${errorMessage}
    Given User entered invalid login scenarios


*** Keywords ***
User entered invalid login scenarios
    [Arguments]      ${username}    ${password}    ${errorMessage}
    Given That the user is on the login page
    And User enter username ${username}
    And User enter password ${password}
    When User click the login button
    Then An error message will appear   ${errorMessage}

