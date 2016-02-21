# frozen_string_literal: true

require 'test_helper'

# Tests to make sure tags can be modified
class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test 'should get index' do
    get tags_url
    assert_response :success
  end

  test 'should get new' do
    get new_tag_url
    assert_response :success
  end

  test 'should create tag' do
    assert_difference('Tag.count') do
      post tags_url, params: { tag: { name: 'New Tag' } }
    end

    assert_redirected_to tag_path(Tag.last)
  end

  test 'should show tag' do
    get tag_url(@tag)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tag_url(@tag)
    assert_response :success
  end

  test 'should update tag' do
    patch tag_url(@tag), params: { tag: { name: 'Updated Tag' } }
    @tag.reload
    assert_redirected_to @tag
  end

  test 'should destroy tag' do
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_path
  end
end
