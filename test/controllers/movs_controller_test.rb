require 'test_helper'

class MovsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mov = movs(:one)
  end

  test "should get index" do
    get movs_url
    assert_response :success
  end

  test "should get new" do
    get new_mov_url
    assert_response :success
  end

  test "should create mov" do
    assert_difference('Mov.count') do
      post movs_url, params: { mov: { cast: @mov.cast, lang: @mov.lang, moviename: @mov.moviename } }
    end

    assert_redirected_to mov_url(Mov.last)
  end

  test "should show mov" do
    get mov_url(@mov)
    assert_response :success
  end

  test "should get edit" do
    get edit_mov_url(@mov)
    assert_response :success
  end

  test "should update mov" do
    patch mov_url(@mov), params: { mov: { cast: @mov.cast, lang: @mov.lang, moviename: @mov.moviename } }
    assert_redirected_to mov_url(@mov)
  end

  test "should destroy mov" do
    assert_difference('Mov.count', -1) do
      delete mov_url(@mov)
    end

    assert_redirected_to movs_url
  end
end
