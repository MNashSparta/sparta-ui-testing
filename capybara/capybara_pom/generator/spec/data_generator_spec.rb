require 'spec_helper'

describe 'testing DataGenerator class' do

  before(:all) do
    @data = DataGenerator.new
  end

  context 'positive paths for the registration form and register' do

    it 'should return a string with a valid first name' do
      expect(@data.first_name).to be_kind_of(String)
      expect(@data.first_name).to match(/[A-Za-z]/)
    end

    it 'should return a string with a valid last name' do
      expect(@data.last_name).to be_kind_of(String)
      expect(@data.last_name).to match(/[A-Za-z]/)
    end

    it 'should return a string with a valid username' do
      expect(@data.user_name).to be_kind_of(String)
      expect(@data.user_name).to match(/[A-Za-z]/)
      expect(@data.user_name.length).to be >= 8
    end

    it 'should return a string with a valid password' do
      expect(@data.password).to be_kind_of(String)
      expect(@data.password).to match(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/)
      expect(@data.password.length).to be_between(8,10)
    end

    it 'should return a string with a valid marital status' do
      @data.marital_options.each do |marital|
        expect(marital).to be_kind_of(String)
        expect(marital).to match(/[A-Za-z]/)
      end
    end

    it 'should return a string with a valid hobby' do
      @data.hobby_options.each do |hobby|
        expect(hobby).to be_kind_of(String)
        expect(hobby).to match(/[A-Za-z]/)
      end
    end

    it 'should return a string with a valid country choice' do
      @data.country_options.each do |country|
        expect(country).to match(/[A-Za-z]/)
        expect(country).to be_kind_of(String)
      end
    end


    it 'should return an Integer between 1950 and 2014' do
      expect(@data.year).to be_kind_of(Integer)
      expect(@data.year).to be_between(1950,2014)
    end

    it 'should return an Integer between 1 and 12' do
      expect(@data.month).to be_kind_of(Integer)
      expect(@data.month).to be_between(1,12)
    end

    it 'should return an Integer between 1 and 31, depending upon the @month' do
      expect(@data.month).to be_kind_of(Integer)
      if (@data.month == 2)
        expect(@data.month).to be_between(1,28)
      elsif (@data.month == 4 || @data.month == 6 || @data.month == 9 || @data.month == 11)
        expect(@data.month).to be_between(1,30)
      else
        expect(@data.month).to be_between(1,31)
      end
    end

    it 'should return a string that contains only numbers' do
      expect(@data.phone_number).to be_kind_of(String)
      expect(@data.phone_number).to match(/[0-9]/)
      expect(@data.phone_number.length).to eq 10
    end

    it 'should ' do

    end

  end

end
