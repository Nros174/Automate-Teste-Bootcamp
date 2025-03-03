from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class SeleniumExtractor:
    
    def __init__(self, driver):
        self.driver = driver

    def click_send_button(self):
        try:
            button = self.driver.find_element(By.XPATH, "//h2//button")
            button.click()
            print("Clicked the send button.")
        except Exception as e:
            print(f"Error in click_send_button: {e}")

    def get_information_from_hq(self):
        try:
            print("Waiting for result text to appear...")
            WebDriverWait(self.driver, 15).until(
                EC.presence_of_element_located((By.ID, "result"))
            )
            result_text = self.driver.execute_script("return document.getElementById('result').textContent;")
            if result_text and result_text.strip():
                print(f"Result text: {result_text.strip()}")
                return result_text.strip()
            else:
                print("Result text is empty. Returning default value.")
                return "No data available"
        except Exception as e:
            print(f"Error in get_information_from_hq: {e}")
            return "Error occurred while fetching data"

    def get_animals(self):
        try:
            animal_elements = self.driver.find_elements(By.CSS_SELECTOR, "div.container.main > div.container")
            visible_animals = [elem for elem in animal_elements if elem.value_of_css_property("visibility") == "visible"]
            return visible_animals
        except Exception as e:
            print(f"Error in get_animals: {e}")
            return []
