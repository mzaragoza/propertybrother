require 'capybara/rspec'

include ActionDispatch::TestProcess

Capybara.javascript_driver = :webkit
Capybara.ignore_hidden_elements = true

Capybara.register_driver :selenium do |app|
  begin
    Selenium::WebDriver::Firefox::Binary.path
  rescue Selenium::WebDriver::Error::WebDriverError
    Selenium::WebDriver::Firefox::Binary.path = "/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox-bin"
  end
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

RSpec.configure do |config|
  config.before(:each, type: :feature) do
  end

  config.before(:each, js: true) do
    Setting.create name: "cache_duration", value: 0
  end

  config.before(:each, js: true) do
    @this_is_js_true = true
  end

  config.before(:each, driver: :selenium) do
    raise "You probably need `js: true` on this spec" unless @this_is_js_true
  end
end

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
  config.allow_url("*.lvh.me")
  config.ignore_ssl_errors
end

