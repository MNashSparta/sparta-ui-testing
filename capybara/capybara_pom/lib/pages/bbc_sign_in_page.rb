require 'capybara/dsl'

class BBCSignInPage

  include Capybara::DSL

  SIGN_IN_BUTTON = '#submit-button'
  USERNAME_FIELD = 'user-identifier-input'
  PASSWORD_FIELD = 'password-input'

  def fill_username username
    fill_in USERNAME_FIELD, with: username
  end

  def fill_password password
    fill_in PASSWORD_FIELD, with: password
  end

  def click_sign_in_button
    find(SIGN_IN_BUTTON).click
  end

  def assert_form_message_username
    page.has_content?("Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here.")
  end
end
