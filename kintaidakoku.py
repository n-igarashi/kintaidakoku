from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import sys

import time  

# python kintaidakoku.py ID password
USERNAME = sys.argv[1]
PASSWORD = sys.argv[2]
CROME_WEBDRIVER_PATH = sys.argv[3]

#Chrome
driver = webdriver.Chrome(CROME_WEBDRIVER_PATH)

# ここにURLを入れる
driver.get("https://teamspirit-****.cloudforce.com/home/home.jsp")

# user name
elem_username = driver.find_element_by_id('username')
elem_username.send_keys(USERNAME)

# password
elem_password = driver.find_element_by_id('password')
elem_password.send_keys(PASSWORD)

# login
elem_loginbtn = driver.find_element_by_id('Login')
elem_loginbtn.click()



# kintaidakoku tab
elem_kintaitab = WebDriverWait(driver, 20).until(
  EC.presence_of_element_located((By.ID, "publisherAttach09D7F00000ImeRq"))
)
elem_kintaitab.click()

# syussha button
elm_iframe = driver.find_element_by_id('09D7F00000ImeRq_0667F000009DcNv')
driver.switch_to.frame(elm_iframe)

elem_syusshabtn = WebDriverWait(driver, 20).until(
  EC.presence_of_element_located((By.ID, 'pushStart'))
)
elem_syusshabtn.click()

time.sleep(5)

driver.close()
driver.quit()