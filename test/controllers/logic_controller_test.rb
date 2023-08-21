# frozen_string_literal: true

require 'test_helper'

class LogicControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get logic_new_url
    assert_response :success
  end

  test 'should get index' do
    get logic_index_url
    assert_response :success
  end

  test 'should get create' do
    get logic_create_url
    assert_response :success
  end
end
