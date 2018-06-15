require 'capybara'
require 'faker'
require_relative '../lib/bbc_site'
require_relative '../generator/lib/data_generator'

RSpec.configure do |whatever|
  whatever.formatter = :documentation
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 10
  config.default_driver = :chrome
end
