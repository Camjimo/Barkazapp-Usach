require 'test_helper'

class TipoMaterialsControllerTest < ActionController::TestCase
  setup do
    @tipo_material = tipo_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_material" do
    assert_difference('TipoMaterial.count') do
      post :create, tipo_material: { nombre: @tipo_material.nombre }
    end

    assert_redirected_to tipo_material_path(assigns(:tipo_material))
  end

  test "should show tipo_material" do
    get :show, id: @tipo_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_material
    assert_response :success
  end

  test "should update tipo_material" do
    patch :update, id: @tipo_material, tipo_material: { nombre: @tipo_material.nombre }
    assert_redirected_to tipo_material_path(assigns(:tipo_material))
  end

  test "should destroy tipo_material" do
    assert_difference('TipoMaterial.count', -1) do
      delete :destroy, id: @tipo_material
    end

    assert_redirected_to tipo_materials_path
  end
end
