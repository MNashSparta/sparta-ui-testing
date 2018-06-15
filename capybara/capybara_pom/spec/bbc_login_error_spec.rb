require 'spec_helper'

describe 'incorrect user login details produced valid error' do


  context 'it should respond with the correct error when incorrect details are given' do

    before(:all) do
      @gen_data = DataGenerator.new
      @site = BBCSite.new
      @real_email = 'mnash@spartaglobal.com'
    end

    it 'should produce an error when given wrong password for a valid account' do
      @site.homepage.visit_homepage
      @site.homepage.click_sign_in

      @site.sign_in_page.fill_username(@gen_data.user_name)
      @site.sign_in_page.fill_password(@gen_data.password)

      @site.sign_in_page.click_sign_in_button

      expect(@site.sign_in_page.assert_form_message_username).to eq true
    end

    it 'should produce an error when given a correct username but the incorrect password' do
      @site.homepage.visit_homepage
      @site.homepage.click_sign_in

      @site.sign_in_page.fill_username(@real_email)
      @site.sign_in_page.fill_password(@gen_data.password)
    end

  end



end
