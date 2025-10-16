require "test_helper"

class TipoUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_usuario = tipo_usuarios(:one)
  end

  test "should get index" do
    get tipo_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_usuario_url
    assert_response :success
  end

  test "should create tipo_usuario" do
    assert_difference("TipoUsuario.count") do
      post tipo_usuarios_url, params: { tipo_usuario: { descricao: @tipo_usuario.descricao } }
    end

    assert_redirected_to tipo_usuario_url(TipoUsuario.last)
  end

  test "should show tipo_usuario" do
    get tipo_usuario_url(@tipo_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_usuario_url(@tipo_usuario)
    assert_response :success
  end

  test "should update tipo_usuario" do
    patch tipo_usuario_url(@tipo_usuario), params: { tipo_usuario: { descricao: @tipo_usuario.descricao } }
    assert_redirected_to tipo_usuario_url(@tipo_usuario)
  end

  test "should destroy tipo_usuario" do
    assert_difference("TipoUsuario.count", -1) do
      delete tipo_usuario_url(@tipo_usuario)
    end

    assert_redirected_to tipo_usuarios_url
  end
end
