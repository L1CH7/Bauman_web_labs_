# frozen_string_literal: true

require 'json'
require 'selenium-webdriver'
require 'rspec'
include RSpec::Expectations

describe 'LW9' do
  before(:each) do
    @selen = Selenium::WebDriver.for :chrome
    @accept_next_alert = true
    @selen.manage.timeouts.implicit_wait = 3000
    @verification_errors = []
  end

  after(:each) do
    @selen.quit
    expect(@verification_errors).to eq []
  end

  it 'test_turbo' do
    @selen.get('http://127.0.0.1:3000/')
    @selen.find_element(:id, 'number_a').click
    @selen.find_element(:id, 'number_a').clear
    @selen.find_element(:id, 'number_a').send_keys('15')

    @selen.find_element(:id, 'number_b').click
    @selen.find_element(:id, 'number_b').clear
    @selen.find_element(:id, 'number_b').send_keys('21')
    @selen.find_element(:id, 'calculate-btn').click

    # find elements in result table
    expect(@selen.find_element(:xpath, "//*[@id='result-table']/tbody/tr[last()]/td[2]").attribute('innerHTML').to_i).to eq 3
    expect(@selen.find_element(:xpath, "//*[@id='result-table']/tbody/tr[last()]/td[3]").attribute('innerHTML').to_i).to eq 0
  end
end
