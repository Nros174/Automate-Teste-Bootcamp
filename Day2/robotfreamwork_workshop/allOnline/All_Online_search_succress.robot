*** Setting ***
Library    SeleniumLibrary
Test Setup    เปิดเว็บเบราว์เซอร์และเข้า ไฟน์ไลน์
Test Teardown    Close Browser

*** variables ***
${URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome


*** Test Cases ***
ทดสอบใส่ ไฟน์ไลน์ ควรเจอ ไฟน์ไลน์
    ค้นหาและตรวจสอบ    ไฟน์ไลน์    ไฟน์ไลน์

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า ไฟน์ไลน์
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผล}
    Input Text    name=q    ${คำค้น}
    Press Keys    None    RETURN
    Wait Until Page Contains    ${ผล}