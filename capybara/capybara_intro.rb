require 'capybara'



Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#Create session
session = Capybara::Session.new(:chrome)

# Page actions
session.visit('http://toolsqa.com/automation-practice-form')

# Filling in
session.fill_in 'firstname',with: 'test'

# Choose radio button
session.choose 'exp-6'

# Selecting from dropdown
session.select 'Europe', from: 'continents'

# Clicking button
session.click_button 'submit'

# Finding a button on the page for assertion
session.find_button('Button')

session.find(:css, '#NestedText')


sleep 3
