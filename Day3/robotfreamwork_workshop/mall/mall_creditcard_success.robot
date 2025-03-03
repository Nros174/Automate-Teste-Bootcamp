*** Setting ***
Library    SeleniumLibrary

*** variables ***
${DEV_URL}    http://159.223.71.75/product/list
${SIT_URL}    http://165.22.255.65/product/list
${UAT_URL}    http://134.209.105.245/product/list
${BROWSER}    chrome
${CARD_NAME_LOCATOR}    product-card-name-1
${CARD_PRICE_LOCATOR}    product-card-price-1
${CARD_NAME}    Balance Training Bicycle
${CARD_PRICE}    ฿4,314.60
${PRODUCT_DETAIL_PIONT}    product-detail-point

*** Test Cases ***
ทดสอบ สินค้า creditcard สำเร็จ
    ค้นหาสินค้าและแสดงรายการสินค้า
    ตรวจสอบผลการค้นหา
    เลือกดูสินค้า
    ตรวจสอบจำนวนแต้มสินค้า
    # เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    เพิ่มสินค้าเข้ารถเข็น
    ตรวจแต้มสินค้าต่อชิ้นในตะกร้าสินค้า
    สั่งซื้อสินค้า
    # ตรวจสอบคำสั่งซื้อ
    ใส่ที่อยู่
    เลือกช่องทางการจัดส่งkerry
    # เลือกช่องทางการชำระเงิน
    # ตรวจสอบค่าใช้จ่าย
    # ชำระค่าใช้จ่าย

*** Keywords ***
ค้นหาสินค้าและแสดงรายการสินค้า
    Open Browser    url=${DEV_URL}    browser=${BROWSER}
    Input Text    id:search-product-input    Bicycle
    Click Element    id:search-product-btn

ตรวจสอบผลการค้นหา
    Wait Until Element Is Visible   id:${CARD_NAME_LOCATOR}
    Element Should Contain    id:${CARD_NAME_LOCATOR}    ${CARD_NAME}
    Element Should Contain    id:${CARD_PRICE_LOCATOR}    ${CARD_PRICE}

เลือกดูสินค้า
    Click Element    id:product-card-1

ตรวจสอบจำนวนแต้มสินค้า
    Wait Until Element Is Visible   id:${PRODUCT_DETAIL_PIONT}
    Element Should Contain    id:${PRODUCT_DETAIL_PIONT}    43 Points


# เพิ่มจำนวนสินค้าที่ต้องการซื้อ
#     Click Element    id:product-detail-quantity-increment-btn
#     Element Attribute Value Should Be   id:product-detail-quantity-input     value    2

เพิ่มสินค้าเข้ารถเข็น
    Click Element    id:product-detail-add-to-cart-btn
    Element Should Contain    id:header-menu-cart-badge    1

ตรวจแต้มสินค้าต่อชิ้นในตะกร้าสินค้า
    Click Element    id:header-menu-cart-btn
    # Wait Until Element Is Visible   id:product-1-point
    # Element Should Contain    id:product-1-point    215 Points

สั่งซื้อสินค้า
    Wait Until Element Is Visible   id:product-1-name
    Click Element    shopping-cart-checkout-btn

# ตรวจสอบคำสั่งซื้อ
#     Element Should Contain    id:product-1-price    ฿30,202.20
#     Element Should Contain    id:product-1-point    302 Points
#     Element Attribute Value Should Be   id:product-1-quantity-input     value    7

ใส่ที่อยู่
    Input Text    id:shipping-form-first-name-input    Bunyanate
    Input Text    id:shipping-form-last-name-input    sansuk
    Input Text    id:shipping-form-address-input    131/91
    Select From List By Value    shipping-form-province-select    1
    Select From List By Value    shipping-form-district-select    1001
    Select From List By Value    shipping-form-sub-district-select    100101
    Element Attribute Value Should Be    id:shipping-form-zipcode-input    value    10200
    Input Text    id:shipping-form-mobile-input    0923456789


เลือกช่องทางการจัดส่งkerry
    Click Element    id:shipping-method-1-input
    Element Should Contain    id:order-summary-shipping-fee-price    ฿50.00


# เลือกช่องทางการชำระเงิน
#     # TODO: implement keyword "เลือกช่องทางการชำระเงิน".
#     Fail    Not Implemented


# ชำระค่าใช้จ่าย
#     # TODO: implement keyword "ชำระค่าใช้จ่าย".
#     Fail    Not Implemented

# ตรวจสอบค่าใช้จ่าย
#     Element Should Contain    id:order-summary-subtotal-price    ฿30,202.18
#     Element Should Contain    id:order-summary-receive-point-price    302 Points
#     Element Should Contain    id:order-summary-shipping-fee-price    ฿50.00
#     Element Should Contain    id:order-summary-total-payment-price    ฿฿30,252.18


    
    




