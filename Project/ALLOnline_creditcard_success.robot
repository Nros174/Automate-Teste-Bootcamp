*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEV_URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome
${PRODUCT_PIONTOR}    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]
${NAME_LOCATOR}    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[2]/div
${PRICE_LOCATOR}    //*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/div[6]/div[2]/span/strong
${PRODUCT_NAME}    ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม (20 กรัม X 6 ซอง)
${PRODUCT_PRICE}    ฿ 37
${PRODUCT_DETAIL_PIONT}    //*[@id="article-form"]/div[1]/div[3]/div/div[2]/div/span/span
${PRODUCT_2_PRICE}     ฿ 74
${NUMBER_PRODUCT}    2

*** Test Cases ***
ทดสอบ สินค้า creditcard สำเร็จ
    เข้าสู่ระบบและปิดคุกกี้
    นำเอาสินค้าเก่าออก
    ค้นหาสินค้าและแสดงรายการสินค้า
    ตรวจสอบผลการค้นหา
    เลือกดูสินค้า
    ตรวจสอบจำนวนแต้มสินค้า
    เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    เพิ่มสินค้าเข้ารถเข็น
    สั่งซื้อสินค้า
    ตรวจสอบรายการสั่งซื้อ
    เลือกวิธีการจัดส่งและใส่ที่อยู่
    เลือกช่องทางการชำระเงิน
    ตรวจสอบค่าใช้จ่าย
    ยืนยันสั่งซื้อสินค้า
    กรอกข้อมูลบัตรเครดิต

*** Keywords ***
เข้าสู่ระบบและปิดคุกกี้
    Open Browser    ${DEV_URL}    ${BROWSER}
    Wait Until Element Is Visible    xpath=//*[@id="alert-cookie-gdpr-allonline__button"]
    Click Element    xpath=//*[@id="alert-cookie-gdpr-allonline__button"]
    Click Element    xpath=//*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Input Text    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[4]/input    mockup@gmail.com
    Input Text    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[5]/input    mock@Cpall
    Click Element    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
    Wait Until Element Is Visible   xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]
    Click Element    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]

นำเอาสินค้าเก่าออก
    Wait Until Element Is Visible   xpath=//*[@id="search_id_form"]/div/div[1]/input
    Click Element    xpath=//*[@id="mini-basket"]/a/i
    Wait Until Element Is Visible   xpath=//*[@id="basket-flyout-items"]/div/div[3]/a/i
    Click Element    xpath=//*[@id="basket-flyout-items"]/div/div[3]/a/i
    Wait Until Element Is Visible   xpath=//*//*[@id="mini-basket-val"]/li[3]/a
    Click Element    xpath=//*//*[@id="mini-basket-val"]/li[3]/a

ค้นหาสินค้าและแสดงรายการสินค้า
    Wait Until Element Is Visible   xpath=//*[@id="search_id_form"]/div/div[1]/input
    Input Text    xpath=//*[@id="search_id_form"]/div/div[1]/input    ${PRODUCT_NAME}
    Click Element    xpath=//*[@id="search_id_form"]/div/span/button

ตรวจสอบผลการค้นหา
    Wait Until Element Is Visible   xpath=${PRODUCT_PIONTOR}
    Element Should Contain     xpath=${NAME_LOCATOR}    ${PRODUCT_NAME}
    Element Should Contain     xpath=${PRICE_LOCATOR}   ${PRODUCT_PRICE}

เลือกดูสินค้า
    Wait Until Element Is Visible   xpath=${PRODUCT_PIONTOR}
    Click Element    xpath=${PRODUCT_PIONTOR}

ตรวจสอบจำนวนแต้มสินค้า
    Wait Until Element Is Visible   xpath=${PRODUCT_DETAIL_PIONT}
    Element Should Contain    xpath=${PRODUCT_DETAIL_PIONT}    9 คะแนน

เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    Click Element    xpath=//*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Element Attribute Value Should Be   xpath=//*[@id="article-form"]/div[2]/div[2]/div[1]/input    value    ${NUMBER_PRODUCT} 

เพิ่มสินค้าเข้ารถเข็น
    Wait Until Element Is Visible    xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
    Click Element    xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
    Wait Until Element Is Visible   xpath=//*[@id="basket-flyout-items"]/div
    Element Should Contain    xpath=//*[@id="basket-flyout-items"]/div/div[2]/div[1]    ${PRODUCT_NAME}
    Element Attribute Value Should Be   xpath=//*[@id="basket-flyout-items"]/div/div[2]/div[2]/div[1]/div/div/input    value    ${NUMBER_PRODUCT}
    Element Should Contain    xpath=//*[@id="basket-flyout-items"]/div/div[2]/div[2]/div[2]    ${PRODUCT_2_PRICE}
    Element Should Contain    xpath=//*[@id="mini-basket-val"]/li[4]/div[2]    ${PRODUCT_2_PRICE}

สั่งซื้อสินค้า
    Click Element    xpath=//*[@id="mini-basket-val"]/li[5]/a[2]

ตรวจสอบรายการสั่งซื้อ
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[1]/div[2]/div[1]/div/div[2]/span[2]    ${PRODUCT_NAME}

เลือกวิธีการจัดส่งและใส่ที่อยู่
    Click Element    xpath=//*[@id="address-tabs"]/ul/li[2]/a
    Wait Until Element Is Visible   xpath=//*[@id="address"]/div[1]/div[2]
    Click Element    xpath=//*[@id="address"]/div[1]/div[2]
    Input Text    id:new-address-name       พันกร
    Input Text    id:new-address-lastname   ชมจันทร์
    Input Text    id:new-address-mobile     0619917765
    Input Text    id:new-address-addrno     45/9
    Input Text    id:new-address-floor      -
    Input Text    id:new-address-moo        7
    Input Text    id:new-address-soi        -  
    Input Text    id:new-address-street     -
    Click Element    xpath=//*[@id="select2-new-address-province-container"]
    Wait Until Element Is Visible   xpath=//*[@class="select2-search__field"]
    Input Text    xpath=//*[@class="select2-search__field"]    สมุทรปราการ
    Wait Until Element Is Visible   xpath=//*[contains(@id, "select2-new-address-province-result") and text()="สมุทรปราการ"]
    Click Element    xpath=//*[contains(@id, "select2-new-address-province-result") and text()="สมุทรปราการ"]

    Click Element    xpath=//*[@id="select2-new-address-district-container"]
    Wait Until Element Is Visible   xpath=//*[@class="select2-search__field"]
    Input Text    xpath=//*[@class="select2-search__field"]    บางพลี
    Wait Until Element Is Visible   xpath=//*[contains(@id, "select2-new-address-district-result") and text()="บางพลี"]
    Click Element    xpath=//*[contains(@id, "select2-new-address-district-result") and text()="บางพลี"]

    Click Element    xpath=//*[@id="select2-new-address-sub-district-container"]
    Wait Until Element Is Visible   xpath=//*[@class="select2-search__field"]
    Input Text    xpath=//*[@class="select2-search__field"]    บางปลา
    Wait Until Element Is Visible   xpath=//*[contains(@id, "select2-new-address-sub-district-result") and text()="บางปลา"]
    Click Element    xpath=//*[contains(@id, "select2-new-address-sub-district-result") and text()="บางปลา"]
    Wait Until Element Is Visible   id:selected-location
    Click Element    id:selected-location
    Wait Until Element Is Visible   id:conf-dif-addr
    Click Element    id:conf-dif-addr
    Wait Until Element Is Visible   id:new-address-postal-code
    Element Attribute Value Should Be   id:new-address-postal-code    value    10540
    Scroll Element Into View    id:continue-payment-btn
    Click Element    id:continue-payment-btn

เลือกช่องทางการชำระเงิน
    Wait Until Element Is Visible    xpath=//*[@id="payment-options"]/div[1]/button    timeout=10
    Click Element    xpath=//*[@id="payment-options"]/div[1]/button

ตรวจสอบค่าใช้จ่าย
    Wait Until Element Is Visible    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    timeout=10
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    ${PRODUCT_NAME}
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]    ${NUMBER_PRODUCT}
    Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[4]    ${PRODUCT_2_PRICE}
    Element Should Contain    xpath=//*[@id="js-invoice-details-tbody"]/tr[1]/td[2]    ${PRODUCT_2_PRICE}
    Element Should Contain    xpath=//*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    ฿ 25
    Element Should Contain    xpath=//*[@id="totalAmount"]    ฿ 99

ยืนยันสั่งซื้อสินค้า
    Click Element    xpath=//*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button

กรอกข้อมูลบัตรเครดิต
    Wait Until Element Is Visible    xpath=//*[@id="csModalContent"]/div[3]/div[2]/div[3]/span[2]    10
    Element Should Contain    xpath=//*[@id="csModalContent"]/div[3]/div[2]/div[3]/span[2]    99.00
    Input Text    xpath=//*[@id="cardName"]        พันกร ชมจันทร์
    Input Text    xpath=//*[@id="cardNumber"]      4624697749177871
    Input Text    xpath=//*[@id="expiryDate"]      01/29
    Input Text    xpath=//*[@id="cvCode"]          476