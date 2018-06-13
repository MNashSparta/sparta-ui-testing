require 'selenium-webdriver'
require 'faker'

chrome_driver = Selenium::WebDriver.for :chrome
chrome_driver.get("http://toolsqa.com/automation-practice-form")

chrome_driver.find_element(:name, 'firstname').send_keys(Faker::Name.first_name)
chrome_driver.find_element(:name, 'lastname').send_keys(Faker::Name.last_name)

sleep 2
