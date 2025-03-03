*** Setting ***
Library    SeleniumLibrary
Suite Setup    เปิดเว็บเบราว์เซอร์
Test Setup    เข้า Google
Test Teardown    Close Browser
Test Template    ค้นหาและตรวจสอบ
Suite Teardown    Close All Browsers

*** variables ***
${URL}    https://www.google.com
${BROWSER}    chrome


*** Test Cases ***
ทดสอบใส่ PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่ Selenium ควรเจอ Selenium    Selenium    Selenium

ทดสอบใส่ Testar ควรเจอ Testar    Testar    Testar


*** Keywords ***
เปิดเว็บเบราว์เซอร์
    Open Browser    browser=${BROWSER}

เข้า Google
    Go To    ${URL}
ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผล}
    Input Text    name=q    ${คำค้น}
    Press Keys    None    RETURN
    Wait Until Page Contains    ${ผล}