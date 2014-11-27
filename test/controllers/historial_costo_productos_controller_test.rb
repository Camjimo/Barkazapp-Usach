require 'test_helper'

class HistorialCostoProductosControllerTest < ActionController::TestCase
  setup do
    @historial_costo_producto = historial_costo_productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_costo_productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_costo_producto" do
    assert_difference('HistorialCostoProducto.count') do
      post :create, historial_costo_producto: { fecha: @historial_costo_producto.fecha, precio: @historial_costo_producto.precio, producto_id: @historial_costo_producto.producto_id }
    end

    assert_redirected_to historial_costo_producto_path(assigns(:historial_costo_producto))
  end

  test "should show historial_costo_producto" do
    get :show, id: @historial_costo_producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_costo_producto
    assert_response :success
  end

  test "should update historial_costo_producto" do
    patch :update, id: @historial_costo_producto, historial_costo_producto: { fecha: @historial_costo_producto.fecha, precio: @historial_costo_producto.precio, producto_id: @historial_costo_producto.producto_id }
    assert_redirected_to historial_costo_producto_path(assigns(:historial_costo_producto))
  end

  test "should destroy historial_costo_producto" do
    assert_difference('HistorialCostoProducto.count', -1) do
      delete :destroy, id: @historial_costo_producto
    end

    assert_redirected_to historial_costo_productos_path
  end
end
