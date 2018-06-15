require 'capybara/dsl'

class BBCHomepage

  include Capybara::DSL

  HOMEPAGE_URL = 'https://www.bbc.co.uk'
  SIGN_ING_LINK_ID = '#idcta-link'

  def visit_homepage
    visit(HOMEPAGE_URL)
  end

  def click_sign_in
    find(SIGN_ING_LINK_ID).click
  end

end
