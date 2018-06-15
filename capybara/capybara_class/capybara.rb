require 'capybara/dsl'

class BBCHomepage

  HOMEPAGE_URL = 'https://www.bbc.co.uk'
  SIGN_ING_LINK_ID = '#idcta-link'

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end

    @driver = Capybara::Session.new(:chrome)
  end

  def visit_homepage
    @driver.visit(HOMEPAGE_URL)
  end

  def click_sign_in
    @driver.find(SIGN_ING_LINK_ID).click
  end

end
bbc = BBCHomepage.new

bbc.visit_homepage
bbc.click_sign_in
