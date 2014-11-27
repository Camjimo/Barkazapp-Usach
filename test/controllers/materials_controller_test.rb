require 'test_helper'

class MaterialsControllerTest < ActionController::TestCase
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post :create, material: { cantidad: @material.cantidad, nombre: @material.nombre, pmp: @material.pmp, tipo_material_id: @material.tipo_material_id, unidad_medida_id: @material.unidad_medida_id, unidad_medida_id: @material.unidad_medida_id }
    end

    assert_redirected_to material_path(assigns(:material))
  end

  test "should show material" do
    get :show, id: @material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material
    assert_response :success
  end

  test "should update material" do
    patch :update, id: @material, material: { cantidad: @material.cantidad, nombre: @material.nombre, pmp: @material.pmp, tipo_material_id: @material.tipo_material_id, unidad_medida_id: @material.unidad_medida_id, unidad_medida_id: @material.unidad_medida_id }
    assert_redirected_to material_path(assigns(:material))
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete :destroy, id: @material
    end

    assert_redirected_to materials_path
  end
end
