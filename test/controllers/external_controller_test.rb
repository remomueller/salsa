# frozen_string_literal: true

require 'test_helper'

# Tests to make sure external page are accessible
class ExternalControllerTest < ActionDispatch::IntegrationTest
  test 'should get landing' do
    get landing_url
    assert_response :success
  end

  test 'should get version' do
    get version_url
    assert_response :success
  end
end
