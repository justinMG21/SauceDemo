*** Settings ***

*** Variables ***
${CONTINUE_SHOPPING}        //button[contains(text(),'Continue Shopping')]
${CHECKOUT_BUTTON}          //button[contains(text(),'Checkout')]
${CONTINUE_BUTTON}          //input[@data-test="continue"]
${FINISH_BUTTON}            //button[contains(text(),'Finish')]
${BACK_HOME}                //button[contains(text(),'Back Home')]

${FIRSTNAME}                //input[@data-test="firstName"]
${LASTNAME}                 //input[@data-test="lastName"]
${POSTAL_CODE}              //input[@data-test="postalCode"]
${CHECKOUT_OVERVIEW_HEADER}     //span[contains(text(),'Checkout: Overview')]

${FIRSTNAME_REQUIRED}       Error: First Name is required
${LASTNAME_REQUIRED}        Error: Last Name is required
${POSTAL_CODE_REQUIRED}     Error: Postal Code is required