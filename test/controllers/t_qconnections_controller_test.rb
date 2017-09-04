require 'test_helper'

class TQconnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @t_qconnection = t_qconnections(:one)
  end

  test "should get index" do
    get t_qconnections_url
    assert_response :success
  end

  test "should get new" do
    get new_t_qconnection_url
    assert_response :success
  end

  test "should create t_qconnection" do
    assert_difference('TQconnection.count') do
      post t_qconnections_url, params: { t_qconnection: { question_id: @t_qconnection.question_id, test_id: @t_qconnection.test_id } }
    end

    assert_redirected_to t_qconnection_url(TQconnection.last)
  end

  test "should show t_qconnection" do
    get t_qconnection_url(@t_qconnection)
    assert_response :success
  end

  test "should get edit" do
    get edit_t_qconnection_url(@t_qconnection)
    assert_response :success
  end

  test "should update t_qconnection" do
    patch t_qconnection_url(@t_qconnection), params: { t_qconnection: { question_id: @t_qconnection.question_id, test_id: @t_qconnection.test_id } }
    assert_redirected_to t_qconnection_url(@t_qconnection)
  end

  test "should destroy t_qconnection" do
    assert_difference('TQconnection.count', -1) do
      delete t_qconnection_url(@t_qconnection)
    end

    assert_redirected_to t_qconnections_url
  end
end
