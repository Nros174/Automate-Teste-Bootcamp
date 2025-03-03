*** Setting ***
Library    SeleniumLibrary

*** variables ***
${URL}    https://www.google.com
${BROWSER}    chrome


*** Test Cases ***
ทดสอบใส่ PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา    PIM
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่ Selenium ควรเจอ Selenium
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา    Selenium
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    Selenium

ทดสอบใส่ Testar ควรเจอ Testar
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา    Testar
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    Testar


*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผล}
    Wait Until Page Contains    ${ผล}
