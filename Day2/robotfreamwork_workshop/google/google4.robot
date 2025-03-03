*** Setting ***
Library    SeleniumLibrary
Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown    Close Browser

*** variables ***
${URL}    https://www.google.com
${BROWSER}    chrome


*** Test Cases ***
ทดสอบใส่ PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    ค้นหาและตรวจสอบ    PIM    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่ Selenium ควรเจอ Selenium
    ค้นหาและตรวจสอบ    Selenium    Selenium

ทดสอบใส่ Testar ควรเจอ Testar
    ค้นหาและตรวจสอบ    Testar    Testar


*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผล}
    Input Text    name=q    ${คำค้น}
    Press Keys    None    RETURN
    Wait Until Page Contains    ${ผล}