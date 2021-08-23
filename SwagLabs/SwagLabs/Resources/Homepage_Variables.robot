*** Settings ***

*** Variables ***
${HOMEPAGE_HEADER_TITLE}            //span[contains(text(),'Products')]
${SORT_DROPDOWN}                    //select[@data-test="product_sort_container"]
${PRODUCTS_NAMES}                    //div[@class="inventory_item_name"]
${PRODUCTS_PRICE}                    //div[@class="inventory_item_price"]
${FIRST_ADD_TO_CART}                (//*[contains(text(),'Add to cart')])[1]
${FIRST_REMOVE_BUTTON}                (//*[contains(text(),'Remove')])[1]
${FIRST_PRODUCT_IMAGE}              (//img[@class="inventory_item_img"])[1]

# Sort Option
${A_TO_Z}                           Name (A to Z)
${Z_TO_A}                           Name (Z to A)
${LOW_TO_HIGH}                      Price (low to high)
${HIGH_TO_LOW}                      Price (high to low)