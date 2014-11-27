require 'test_helper'

class EquivalenciaControllerTest < ActionController::TestCase
  setup do
    @equivalencium = equivalencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equivalencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equivalencium" do
    assert_difference('Equivalencium.count') do
      post :create, equivalencium: { cantidad: @equivalencium.cantidad, tipo_contenedor_id: @equivalencium.tipo_contenedor_id, unidad_medida_id: @equivalencium.unidad_medida_id }
    end

    assert_redirected_to equivalencium_path(assigns(:equivalencium))
  end

  test "should show equivalencium" do
    get :show, id: @equivalencium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equivalencium
    assert_response :success
  end

  test "should update equivalencium" do
    patch :update, id: @equivalencium, equivalencium: { cantidad: @equivalencium.cantidad, tipo_contenedor_id: @equivalencium.tipo_contenedor_id, unidad_medida_id: @equivalencium.unidad_medida_id }
    assert_redirected_to equivalencium_path(assigns(:equivalencium))
  end

  test "should destroy equivalencium" do
    assert_difference('Equivalencium.count', -1) do
      delete :destroy, id: @equivalencium
    end

    assert_redirected_to equivalencia_path
  end
end
