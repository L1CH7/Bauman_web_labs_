# frozen_string_literal: true

require 'json'
require 'selenium-webdriver'
require 'rspec'
include RSpec::Expectations

describe 'LW12' do
  before(:each) do
    @selen = Selenium::WebDriver.for :chrome
    @accept_next_alert = true
    @selen.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @selen.quit
    expect(@verification_errors).to eq []
  end

  it 'uncorrect_pasword' do
    @selen.get 'http://localhost:3000/users/sign_in'
    @selen.find_element(:name, 'user[email]').clear
    @selen.find_element(:name, 'user[email]').send_keys 'someone@gmail.com'
    @selen.find_element(:xpath, "//form[@id='new_user']/div[3]").click
    @selen.find_element(:name, 'user[password]').click
    @selen.find_element(:name, 'user[password]').clear
    @selen.find_element(:name, 'user[password]').send_keys '123456'
    @selen.find_element(:name, 'commit').click
    @selen.find_element(:xpath, "//*/text()[normalize-space(.)='Invalid Email or password.']/parent::*").click
  end

  it 'test_correct_password' do
    @selen.get 'http://localhost:3000/users/sign_in'
    @selen.find_element(:name, 'user[email]').click
    @selen.find_element(:name, 'user[email]').clear
    @selen.find_element(:name, 'user[email]').send_keys 'someone@gmail.com'
    @selen.find_element(:xpath, "//form[@id='new_user']/div[3]").click
    @selen.find_element(:name, 'user[password]').click
    @selen.find_element(:name, 'user[password]').clear
    @selen.find_element(:name, 'user[password]').send_keys '222222'
    @selen.find_element(:name, 'commit').click
  end

  it 'test_log_out' do
    @selen.get 'http://localhost:3000/users/sign_in'
    @selen.find_element(:name, 'user[email]').click
    @selen.find_element(:name, 'user[email]').clear
    @selen.find_element(:name, 'user[email]').send_keys 'someone@gmail.com'
    @selen.find_element(:xpath, "//form[@id='new_user']/div[3]").click
    @selen.find_element(:name, 'user[password]').click
    @selen.find_element(:name, 'user[password]').clear
    @selen.find_element(:name, 'user[password]').send_keys '222222'
    @selen.find_element(:name, 'commit').click
    @selen.find_element(:xpath, "//button[@type='submit']").click
  end

  it 'test_buttons' do
    # @selen.get 'http://localhost:3000/users/sign_in'
    # @selen.find_element(:name, 'user[email]').click
    # @selen.find_element(:name, 'user[email]').clear
    # @selen.find_element(:name, 'user[email]').send_keys 'someone@gmail.com'
    # @selen.find_element(:xpath, "//form[@id='new_user']/div[4]").click
    # @selen.find_element(:name, 'user[password]').click
    # @selen.find_element(:name, 'user[password]').clear
    # @selen.find_element(:name, 'user[password]').send_keys '222222'
    # @selen.find_element(:name, 'commit').click
    # @selen.find_element(:xpath,
    #                      "(.//*[normalize-space(text()) and normalize-space(.)='Show profile'])[1]/following::button[1]").click
    # @selen.find_element(:xpath,
    #                      "(.//*[normalize-space(text()) and normalize-space(.)='Edit profile'])[1]/following::button[1]").click
    # # @selen.find_element(:xpath,
    # #                      "(.//*[normalize-space(text()) and normalize-space(.)='updated at'])[1]/following::button[1]").click
    # @selen.find_element(:xpath,
    #                      "(.//*[normalize-space(text()) and normalize-space(.)='See all users'])[1]/following::button[1]").click
    # @selen.find_element(:link, 'Back').click
    # @selen.find_element(:xpath,
    #                      "(.//*[normalize-space(text()) and normalize-space(.)='Log out'])[1]/following::button[1]").click
    @selen.get('http://[::1]:3000/users/sign_in')
    @selen.find_element(:name, 'user[email]').click
    @selen.find_element(:name, 'user[email]').clear
    @selen.find_element(:name, 'user[email]').send_keys('aboba@example.com')
    @selen.find_element(:name, 'user[password]').click
    @selen.find_element(:name, 'user[password]').clear
    @selen.find_element(:name, 'user[password]').send_keys('admin123')
    @selen.find_element(:name, 'commit').click
    @selen.find_element(:css, 'div:nth-child(7) button').click
    @selen.find_element(:css, 'div:nth-child(6) button').click
    @selen.find_element(:css, 'div:nth-child(5) button').click
    @selen.find_element(:css, '.button_to:nth-child(11) > button').click
  end

  it 'test_calc' do
    @selen.get('http://127.0.0.1:3000/users/sign_in')
    @selen.find_element(:name, 'user[email]').send_keys('aboba@example.com')
    @selen.find_element(:name, 'user[password]').send_keys('admin123')
    @selen.find_element(:name, 'commit').click
    @selen.find_element(:id, 'number_a').click
    @selen.find_element(:id, 'number_a').send_keys('21')
    @selen.find_element(:id, 'number_b').click
    @selen.find_element(:id, 'number_b').send_keys('14')
    @selen.find_element(:name, 'commit').click
    @selen.find_element(:css, '.button_to:nth-child(14) > button').click
  end
  
  def element_present?(how, what)
    @selen.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?
    @selen.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify
    yield
  rescue ExpectationNotMetError => e
    @verification_errors << e
  end

  def close_alert_and_get_its_text(_how, _what)
    alert = @selen.switch_to.alert()
    alert_text = alert.text
    if @accept_next_alert
      alert.accept
    else
      alert.dismiss
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
