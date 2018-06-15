require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'

class BBCSite

  def homepage
    BBCHomepage.new
  end

  def sign_in_page
    BBCSignInPage.new
  end

end
