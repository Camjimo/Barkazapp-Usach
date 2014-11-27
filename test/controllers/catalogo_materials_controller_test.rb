require 'test_helper'

class CatalogoMaterialsControllerTest < ActionController::TestCase
  setup do
    @catalogo_material = catalogo_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalogo_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalogo_material" do
    assert_difference('CatalogoMaterial.count') do
      post :create, catalogo_material: { cantidad_material: @catalogo_material.cantidad_material, material_id: @catalogo_material.material_id, precio_material: @catalogo_material.precio_material, proveedor_id: @catalogo_material.proveedor_id, unidad_medida_id: @catalogo_material.unidad_medida_id }
    end

    assert_redirected_to catalogo_material_path(assigns(:catalogo_material))
  end

  test "should show catalogo_material" do
    get :show, id: @catalogo_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalogo_material
    assert_response :success
  end

  test "should update catalogo_material" do
    patch :update, id: @catalogo_material, catalogo_material: { cantidad_material: @catalogo_material.cantidad_material, material_id: @catalogo_material.material_id, precio_material: @catalogo_material.precio_material, proveedor_id: @catalogo_material.proveedor_id, unidad_medida_id: @catalogo_material.unidad_medida_id }
    assert_redirected_to catalogo_material_path(assigns(:catalogo_material))
  end

  test "should destroy catalogo_material" do
    assert_difference('CatalogoMaterial.count', -1) do
      delete :destroy, id: @catalogo_material
    end

    assert_redirected_to catalogo_materials_path
  end
end
