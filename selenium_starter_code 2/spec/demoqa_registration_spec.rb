require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @user_name = Faker::Internet.user_name(8)
    @password = Faker::Internet.password(8)
    @email = Faker::Internet.email
    @phone_number = Faker::Number.number(10)
    @marital_options = ["single","married","divorced"]
    @day = Faker::Number.between(1, 28)
    @month = Faker::Number.between(1, 12)
    @year = Faker::Number.between(1950, 2014)
    @country = Faker::Address.country
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      @driver.set_first_name_field(@first_name)
      expect(@driver.first_name_field_displayed).to eq(true)
      expect(@driver.get_first_name_field_value).to eq(@first_name)
    end

    it 'should accept a last name' do
      @driver.set_last_name_field(@last_name)
      expect(@driver.last_name_field_displayed).to eq(true)
      expect(@driver.get_last_name_field_value).to eq(@last_name)
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @driver.select_marital_option("single")
      @driver.select_marital_option("married")
      @driver.select_marital_option("divorced")
      @driver.select_marital_option(@marital_options.sample)
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option("dance")
      @driver.select_hobby_option("reading")
      @driver.select_hobby_option("cricket ")
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eq('Afghanistan')
    end

    it 'accept a new DOB' do
      @driver.dob_day_list_select(@day)
      @driver.dob_month_list_select(@month)
      @driver.dob_year_list_select(@year)
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select(@country)

    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field(@phone_number)
    end

    it 'should accept a username' do
      @driver.set_user_name_field(@user_name)
    end

    it 'should accept an email' do
      @driver.set_email_field(@email)
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field(@first_name)
    end

    it 'should accept a password' do
      @driver.set_password_field(@password)
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field(@password)
    end

    it 'should click the submit button' do
      @driver.click_submit
    end

    it 'should return a message upon registration' do
      expect(@driver.check_registration_successful).to eq(true)
    end

  end

end
