require "test_helper"

class DistritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distrito = distritos(:one)
  end

  test "should get index" do
    get distritos_url
    assert_response :success
  end

  test "should get new" do
    get new_distrito_url
    assert_response :success
  end

  test "should create distrito" do
    assert_difference("Distrito.count") do
      post distritos_url, params: { distrito: { municipio_id: @distrito.municipio_id, nome: @distrito.nome } }
    end

    assert_redirected_to distrito_url(Distrito.last)
  end

  test "should show distrito" do
    get distrito_url(@distrito)
    assert_response :success
  end

  test "should get edit" do
    get edit_distrito_url(@distrito)
    assert_response :success
  end

  test "should update distrito" do
    patch distrito_url(@distrito), params: { distrito: { municipio_id: @distrito.municipio_id, nome: @distrito.nome } }
    assert_redirected_to distrito_url(@distrito)
  end

  test "should destroy distrito" do
    assert_difference("Distrito.count", -1) do
      delete distrito_url(@distrito)
    end

    assert_redirected_to distritos_url
  end
end
