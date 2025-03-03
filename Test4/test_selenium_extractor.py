from selenium import webdriver
from selenium_extractor import SeleniumExtractor

driver = webdriver.Chrome()
driver.get("resources\__files\index.html")  # เปลี่ยน path ให้ตรงกับไฟล์ HTML ของคุณ

extractor = SeleniumExtractor(driver)

# ทดสอบ click_send_button
print("ผลลัพธ์จาก click_send_button:")
result_text = extractor.click_send_button()
print(result_text)

# ทดสอบ get_information_from_hq
print("\nข้อมูลจาก HQ:")
hq_info = extractor.get_information_from_hq()
print(hq_info)

# ทดสอบ get_animals
print("\nรายชื่อสัตว์ที่ต้องตรวจสอบ:")
animals = extractor.get_animals()
for animal in animals:
    print(animal.text)

driver.quit()