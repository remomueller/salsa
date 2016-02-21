# frozen_string_literal: true

require 'test_helper'

# Tests to assure moves can be viewed, created, and modified
class MovesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @move = moves(:one)
  end

  test 'should get index' do
    get moves_url
    assert_response :success
  end

  test 'should get new' do
    get new_move_url
    assert_response :success
  end

  test 'should create move' do
    assert_difference('Tag.count', 1) do
      assert_difference('Move.count') do
        post moves_url, params: { move: { name: @move.name,
                                          description: @move.description,
                                          video_url: @move.video_url,
                                          tag_tokens: 'wrap, cross body, back break' } }
      end
    end

    assert_equal 3, Move.last.tags.count

    assert_redirected_to move_path(Move.last)
  end

  test 'should show move' do
    get move_url(@move)
    assert_response :success
  end

  test 'should get edit' do
    get edit_move_url(@move)
    assert_response :success
  end

  test 'should update move' do
    patch move_url(@move), params: { move: { name: @move.name,
                                             description: @move.description,
                                             video_url: @move.video_url,
                                             tag_tokens: '' } }
    assert_redirected_to move_path(@move)
  end

  test 'should destroy move' do
    assert_difference('Move.count', -1) do
      delete move_url(@move)
    end

    assert_redirected_to moves_path
  end
end
