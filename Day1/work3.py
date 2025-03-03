from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time # สําหรับเพิ่มเวลาหยุดชั่วคราว

# ระบุเส้นทาง ChromeDriver
service = Service('C:\Program Files (x86)\chromedriver-win64\chromedriver.exe')
driver = webdriver.Chrome(service=service)

try:
    # เปิดหน้า Google
    driver.get("https://www.google.com")
    print("Opened Google homepage.")

    # เพิ่มเวลารอหน้าเว็บโหลด (หากจําเป็นถึงใช้ เพราะจะช้า ถ้ามีแปลว่าไม่ดี)
    time.sleep(3)

    # ใช้ Explicit Wait เพื่อรอให้ Search Bar ปรากฏ
    wait = WebDriverWait(driver, 10)
    search_bar = wait.until(EC.presence_of_element_located((By.NAME, "q")))
    print("Search bar is ready.")

    # กรอกข้อความใน Search Bar
    search_query = "PIM"
    search_bar.send_keys(search_query)
    print(f"Searching for: {search_query}")

    # กด Enter เพื่อค้นหา
    search_bar.submit()

    # รอให้หน้าแสดงผลลัพธ์การค้นหา
    wait.until(EC.presence_of_element_located((By.ID, "search")))
    print("Search completed. Results displayed.")

except Exception as e:
    print(f"Error occurred: {e}")

finally:
    # ปิดเบราว์เซอร์
    driver.quit()
    print("Browser closed.")

print(".......................")

# from selenium import webdriver
# from selenium.webdriver.chrome.service import Service
# from selenium.webdriver.common.by import By
# from selenium.webdriver.support.ui import WebDriverWait
# from selenium.webdriver.support import expected_conditions as EC

# # ระบุเส้นทางของ ChromeDriver
# service = Service('C:\Program Files (x86)\chromedriver-win64\chromedriver.exe')
# driver = webdriver.Chrome(service=service)

# # เปิดหน้า allonline
# driver.get("https://www.allonline.7eleven.co.th/")

# try:
#     # ใช้ Explicit Wait เพื่อรอให้ Search Bar พร้อมใช้งาน
#     wait = WebDriverWait(driver, 10)
#     search_bar_xpath = wait.until(EC.presence_of_element_located((By.XPATH,
#     "//input[@id='searchInput']")))

#     # กรอกข้อความใน Search Bar และค้นหา
#     search_query = "ไฟน์ไลน์"
#     search_bar_xpath.send_keys(search_query)
#     search_bar_xpath.submit()
#     print(f"Searching for: {search_query}")

#     # รอให้ผลลัพธ์การค้นหาปรากฏ
#     result_heading = wait.until(EC.presence_of_element_located((By.ID,
#     "firstHeading")))
#     print(f"Search result heading: {result_heading.text}")

# except Exception as e:
#     print(f"Error: {e}")

# finally:
#     # ปิดเบราว์เซอร์
#     driver.quit()

print(".......................")
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# ระบุเส้นทาง ChromeDriver
service = Service('C:\\Program Files (x86)\\chromedriver-win64\\chromedriver.exe')

# เปิด ChromeDriver
driver = webdriver.Chrome(service=service)

try:
    # เปิดหน้า AllOnline
    driver.get("https://www.allonline.7eleven.co.th/")
    print("Opened AllOnline homepage.")

    # ใช้ Explicit Wait เพื่อรอให้ Search Bar พร้อมใช้งาน
    wait = WebDriverWait(driver, 10)
    search_bar = wait.until(EC.presence_of_element_located((By.XPATH, "//input[@id='searchInput']")))
    print("Search bar is ready.")

    # กรอกข้อความใน Search Bar และค้นหา
    search_query = "ไฟน์ไลน์"
    search_bar.send_keys(search_query)
    search_bar.submit()
    print(f"Searching for: {search_query}")

    # รอให้หน้าแสดงผลลัพธ์การค้นหาโหลด
    wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/h1')))
    actual_element = driver.find_element(By.XPATH, '//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/h1')

    # ดึงข้อความจากองค์ประกอบ h1
    print(f"Search result heading: {actual_element.text}")

except Exception as e:
    print(f"Error: {e}")

finally:
    # ปิดเบราว์เซอร์
    driver.quit()
    print("Browser closed.")


search_bar_xpath = driver.find_element("xpath", "//input[@id='searchInput']")
search_bar_xpath.send_keys("XPath Combined Example")

search_button_css = driver.find_element("css selector", "button.pure-button")
search_button_css.click()

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

# ระบุเส้นทางของ ChromeDriver
service = Service('C:\\Drivers\\Chrome\\chromedriver-win64\\chromedriver.exe')
driver = webdriver.Chrome(service=service)

try:
    # เปิดหน้า Wikipedia
    driver.get("https://www.wikipedia.org")
    print("Opened Wikipedia homepage.")

# ค้นหา Search Bar ด้วย ID
    search_bar = driver.find_element(By.ID, "searchInput")

    # กรอกคําค้นหาและส่งฟอร์ม
    search_query = "Automated Testing"
    search_bar.send_keys(search_query)
    search_bar.submit()
    print(f"Searched for: {search_query}")
    # แสดงชื่อของหน้าใหม่ (Title)

    print("New Page Title:", driver.title)

except Exception as e:
    print(f"Error: {e}")

finally:
    # ปิดเบราว์เซอร์
    driver.quit()
    print("Browser closed.")