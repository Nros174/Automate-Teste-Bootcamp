import selenium
print(selenium.__version__)


print("############################1#################################")
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

# กำหนดเส้นทางของ ChromeDriver
service = Service('C:\Program Files (x86)\chromedriver-win64\chromedriver.exe')

# สร้าง WebDriver
driver = webdriver.Chrome(service=service)

# เปิดเว็บไซต์
driver.get("https://www.google.com")
print(driver.title)

# ปิดเบราว์เซอร์
driver.quit()


print("##########################2###################################")

from selenium import webdriver
from selenium.webdriver.chrome.service import Service

# ระบุเส้นทางของ ChromeDriver
service = Service('C:\Program Files (x86)\chromedriver-win64\chromedriver.exe')

# สร้าง WebDriver
driver = webdriver.Chrome(service=service)

# เปิดเว็บไซต์ Google
driver.get("https://www.google.com")

# Locate search bar using name
search_bar = driver.find_element("name", "q")

# Enter text into search bar
search_bar.send_keys("Automated Testing")
search_bar.submit()

# ปิดเบราว์เซอร์
driver.quit()

print("########################3#####################################")

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import Select, WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC

try:
    # ระบุเส้นทางของ ChromeDriver
    service = Service('C:\Program Files (x86)\chromedriver-win64\chromedriver.exe')
    driver = webdriver.Chrome(service=service)

    # เปิดเว็บไซต์ใหม่ที่มี Dropdown
    driver.get("https://practice.expandtesting.com/dropdown?utm_source=chatgpt.com")

    # รอให้ Dropdown ปรากฏ
    dropdown_element = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "dropdown"))
    )

    # Handle Dropdown
    dropdown = Select(dropdown_element)

    # ตรวจสอบตัวเลือกทั้งหมดที่มีใน Dropdown
    options = [option.text for option in dropdown.options]
    print("Available options:", options)

    # เลือกตัวเลือก (ปรับให้ตรงกับตัวเลือกใน Dropdown)
    test_option = "Option 2"  # ปรับตามตัวเลือกที่คุณต้องการ
    dropdown.select_by_visible_text(test_option)

    # ตรวจสอบว่าตัวเลือกที่เลือกถูกต้อง
    selected_option = dropdown.first_selected_option.text
    if selected_option == test_option:
        print(f"✅ Test Passed: Selected option is '{selected_option}' as expected.")
    else:
        print(f"❌ Test Failed: Selected option is '{selected_option}', expected '{test_option}'.")

except Exception as e:
    print(f"❌ Test Failed: An error occurred - {str(e)}")

finally:
    # ปิดเบราว์เซอร์
    driver.quit()

print("##########################4###################################")


from selenium import webdriver
from selenium.webdriver.chrome.service import Service

service = Service('C:\Program Files (x86)\chromedriver-win64\chromedriver.exe')
driver = webdriver.Chrome(service=service)
# เปิดเว็บไซต์ Wikipedia
driver.get("https://www.wikipedia.org")
print("Page title:", driver.title)
# แสดง URL ปัจจุบัน
print("Current URL:", driver.current_url)
# driver.quit()

print("##########################5###################################")
driver = webdriver.Chrome(service=service)

# ขยายหน้าต่างเบราว์เซอร์
driver.maximize_window()
# ย่อหน้าต่างเบราว์เซอร์
driver.minimize_window()

driver.quit()

