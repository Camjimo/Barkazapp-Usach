require 'test_helper'

class PedidosControllerTest < ActionController::TestCase
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post :create, pedido: { estado_pedido_id: @pedido.estado_pedido_id, fecha: @pedido.fecha, mesa_id: @pedido.mesa_id, monto_total: @pedido.monto_total, nuevo: @pedido.nuevo, tipo_pago_id: @pedido.tipo_pago_id, usuario_id: @pedido.usuario_id }
    end

    assert_redirected_to pedido_path(assigns(:pedido))
  end

  test "should show pedido" do
    get :show, id: @pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedido
    assert_response :success
  end

  test "should update pedido" do
    patch :update, id: @pedido, pedido: { estado_pedido_id: @pedido.estado_pedido_id, fecha: @pedido.fecha, mesa_id: @pedido.mesa_id, monto_total: @pedido.monto_total, nuevo: @pedido.nuevo, tipo_pago_id: @pedido.tipo_pago_id, usuario_id: @pedido.usuario_id }
    assert_redirected_to pedido_path(assigns(:pedido))
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete :destroy, id: @pedido
    end

    assert_redirected_to pedidos_path
  end
end
