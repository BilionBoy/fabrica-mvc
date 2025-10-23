require "test_helper"

class StatusOsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_o = status_os(:one)
  end

  test "should get index" do
    get status_os_url
    assert_response :success
  end

  test "should get new" do
    get new_status_o_url
    assert_response :success
  end

  test "should create status_o" do
    assert_difference("StatusO.count") do
      post status_os_url, params: { status_o: { descricao: @status_o.descricao } }
    end

    assert_redirected_to status_o_url(StatusO.last)
  end

  test "should show status_o" do
    get status_o_url(@status_o)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_o_url(@status_o)
    assert_response :success
  end

  test "should update status_o" do
    patch status_o_url(@status_o), params: { status_o: { descricao: @status_o.descricao } }
    assert_redirected_to status_o_url(@status_o)
  end

  test "should destroy status_o" do
    assert_difference("StatusO.count", -1) do
      delete status_o_url(@status_o)
    end

    assert_redirected_to status_os_url
  end
end
