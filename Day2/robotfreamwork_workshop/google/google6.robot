*** Setting ***
Library    SeleniumLibrary
Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown    Close Browser
Test Template    ค้นหาและตรวจสอบ

*** variables ***
${URL}    https://www.google.com
${BROWSER}    chrome


*** Test Cases ***
ทดสอบใส่ PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่ Selenium ควรเจอ Selenium    Selenium    Selenium

ทดสอบใส่ Testar ควรเจอ Testar    Testar    Testar


*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผล}
    Input Text    name=q    ${คำค้น}
    Press Keys    None    RETURN
    Wait Until Page Contains    ${ผล}