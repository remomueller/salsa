# frozen_string_literal: true

require 'test_helper'

# Tests to make sure tags can be modified
class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test 'should get index as regular user' do
    login(users(:regular))
    get tags_url
    assert_response :success
  end

  test 'should get new as regular user' do
    login(users(:regular))
    get new_tag_url
    assert_response :success
  end

  test 'should create tag as regular user' do
    login(users(:regular))
    assert_difference('Tag.count') do
      post tags_url, params: { tag: { name: 'New Tag' } }
    end

    assert_redirected_to tag_path(Tag.last)
  end

  test 'should show tag as regular user' do
    login(users(:regular))
    get tag_url(@tag)
    assert_response :success
  end

  test 'should get edit as regular user' do
    login(users(:regular))
    get edit_tag_url(@tag)
    assert_response :success
  end

  test 'should update tag as regular user' do
    login(users(:regular))
    patch tag_url(@tag), params: { tag: { name: 'Updated Tag' } }
    @tag.reload
    assert_redirected_to @tag
  end

  test 'should destroy tag as regular user' do
    login(users(:regular))
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_path
  end
end
