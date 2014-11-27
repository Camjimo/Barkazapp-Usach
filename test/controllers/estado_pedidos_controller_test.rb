require 'test_helper'

class EstadoPedidosControllerTest < ActionController::TestCase
  setup do
    @estado_pedido = estado_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estado_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_pedido" do
    assert_difference('EstadoPedido.count') do
      post :create, estado_pedido: { nombre: @estado_pedido.nombre }
    end

    assert_redirected_to estado_pedido_path(assigns(:estado_pedido))
  end

  test "should show estado_pedido" do
    get :show, id: @estado_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estado_pedido
    assert_response :success
  end

  test "should update estado_pedido" do
    patch :update, id: @estado_pedido, estado_pedido: { nombre: @estado_pedido.nombre }
    assert_redirected_to estado_pedido_path(assigns(:estado_pedido))
  end

  test "should destroy estado_pedido" do
    assert_difference('EstadoPedido.count', -1) do
      delete :destroy, id: @estado_pedido
    end

    assert_redirected_to estado_pedidos_path
  end
end
