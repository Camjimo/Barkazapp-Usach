require 'test_helper'

class TipoContenedorsControllerTest < ActionController::TestCase
  setup do
    @tipo_contenedor = tipo_contenedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_contenedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_contenedor" do
    assert_difference('TipoContenedor.count') do
      post :create, tipo_contenedor: { nombre: @tipo_contenedor.nombre }
    end

    assert_redirected_to tipo_contenedor_path(assigns(:tipo_contenedor))
  end

  test "should show tipo_contenedor" do
    get :show, id: @tipo_contenedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_contenedor
    assert_response :success
  end

  test "should update tipo_contenedor" do
    patch :update, id: @tipo_contenedor, tipo_contenedor: { nombre: @tipo_contenedor.nombre }
    assert_redirected_to tipo_contenedor_path(assigns(:tipo_contenedor))
  end

  test "should destroy tipo_contenedor" do
    assert_difference('TipoContenedor.count', -1) do
      delete :destroy, id: @tipo_contenedor
    end

    assert_redirected_to tipo_contenedors_path
  end
end
