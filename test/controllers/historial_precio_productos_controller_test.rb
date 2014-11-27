require 'test_helper'

class HistorialPrecioProductosControllerTest < ActionController::TestCase
  setup do
    @historial_precio_producto = historial_precio_productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historial_precio_productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historial_precio_producto" do
    assert_difference('HistorialPrecioProducto.count') do
      post :create, historial_precio_producto: { fecha: @historial_precio_producto.fecha, precio: @historial_precio_producto.precio, producto_id: @historial_precio_producto.producto_id }
    end

    assert_redirected_to historial_precio_producto_path(assigns(:historial_precio_producto))
  end

  test "should show historial_precio_producto" do
    get :show, id: @historial_precio_producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historial_precio_producto
    assert_response :success
  end

  test "should update historial_precio_producto" do
    patch :update, id: @historial_precio_producto, historial_precio_producto: { fecha: @historial_precio_producto.fecha, precio: @historial_precio_producto.precio, producto_id: @historial_precio_producto.producto_id }
    assert_redirected_to historial_precio_producto_path(assigns(:historial_precio_producto))
  end

  test "should destroy historial_precio_producto" do
    assert_difference('HistorialPrecioProducto.count', -1) do
      delete :destroy, id: @historial_precio_producto
    end

    assert_redirected_to historial_precio_productos_path
  end
end
