*** Setting ***
Library    SeleniumLibrary

*** variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

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