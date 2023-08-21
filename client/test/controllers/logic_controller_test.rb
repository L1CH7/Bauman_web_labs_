# frozen_string_literal: true

require 'test_helper'

class LogicControllerTest < ActionDispatch::IntegrationTest
  test 'should get view' do
    get logic_view_url
    assert_response :success
  end
end
