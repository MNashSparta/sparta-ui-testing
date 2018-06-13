require 'selenium-webdriver'

class SeleniumQAToolsForm


  attr_accessor :first_name_input, :last_name_input, :date_input, :checkbox_value_input, :img_src

  def initialize
    @practice_form_url = 'http://toolsqa.com/automation-practice-form'
    @first_name_input = 'firstname'
    @last_name_input = 'lastname'
    @date_input = '03/03/14'
    @checkbox_value_input = 1
    @img_src = "/Users/tech-a67/Downloads/canadaLifeLogo.jpg"
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

  def first_name_field text
    @chrome_driver.find_element(:name, 'firstname').send_keys(text)
  end

  def last_name_field text
    @chrome_driver.find_element(:name, 'lastname').send_keys(text)
  end

  def date_picker_field text
    @chrome_driver.find_element(:id, 'datepicker').send_keys(text)
  end

  def sex_radio_button number
    @chrome_driver.find_element(:id, "sex-#{number}").click
  end

  def experience_radio_button number
    @chrome_driver.find_element(:id, "exp-#{number}").click
  end

  def profession_checkbox number
    @chrome_driver.find_element(:id, "profession-#{number}").click
  end

  def profile_picture_upload img_src
    @chrome_driver.find_element(:id, "photo").send_keys(img_src)
  end

  def tool_checkbox number
    @chrome_driver.find_element(:id, "tool-#{number}").click
  end

  def country_dropdown number
    @chrome_driver.find_element(:id, "continents").find_elements(:tag_name, "option")[number].click
  end

  def commands_list number
    @chrome_driver.find_element(:id, "selenium_commands").find_elements(:tag_name, "option")[number].click
  end

end

test = SeleniumQAToolsForm.new
test.visit_practice_form
test.first_name_field(test.first_name_input)
test.last_name_field(test.last_name_input)
test.date_picker_field(test.date_input)
test.sex_radio_button(test.checkbox_value_input)
test.experience_radio_button(test.checkbox_value_input)
test.profession_checkbox(test.checkbox_value_input)
test.tool_checkbox(test.checkbox_value_input)
test.country_dropdown(test.checkbox_value_input)
test.commands_list(test.checkbox_value_input)
test.profile_picture_upload(test.img_src)
