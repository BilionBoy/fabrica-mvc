require "test_helper"

class StatusEmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_empresa = status_empresas(:one)
  end

  test "should get index" do
    get status_empresas_url
    assert_response :success
  end

  test "should get new" do
    get new_status_empresa_url
    assert_response :success
  end

  test "should create status_empresa" do
    assert_difference("StatusEmpresa.count") do
      post status_empresas_url, params: { status_empresa: { descricao: @status_empresa.descricao } }
    end

    assert_redirected_to status_empresa_url(StatusEmpresa.last)
  end

  test "should show status_empresa" do
    get status_empresa_url(@status_empresa)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_empresa_url(@status_empresa)
    assert_response :success
  end

  test "should update status_empresa" do
    patch status_empresa_url(@status_empresa), params: { status_empresa: { descricao: @status_empresa.descricao } }
    assert_redirected_to status_empresa_url(@status_empresa)
  end

  test "should destroy status_empresa" do
    assert_difference("StatusEmpresa.count", -1) do
      delete status_empresa_url(@status_empresa)
    end

    assert_redirected_to status_empresas_url
  end
end
