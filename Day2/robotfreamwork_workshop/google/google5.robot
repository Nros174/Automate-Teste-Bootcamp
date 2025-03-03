*** Setting ***
Library    SeleniumLibrary
Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown    Close Browser

*** variables ***
${URL}    https://www.google.com
${BROWSER}    chrome


*** Test Cases ***
ทดสอบใส่ คำค้นหา ควรเจอ ผลลัพธ์ที่ต้องการ
    [Template]    ค้นหาและตรวจสอบ
    PIM    สถาบันการจัดการปัญญาภิวัฒน์
    Selenium    Selenium
    Testar    Testar

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผล}
    Input Text    name=q    ${คำค้น}
    Press Keys    None    RETURN
    Wait Until Page Contains    ${ผล}