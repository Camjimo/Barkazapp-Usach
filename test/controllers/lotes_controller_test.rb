require 'test_helper'

class LotesControllerTest < ActionController::TestCase
  setup do
    @lote = lotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lote" do
    assert_difference('Lote.count') do
      post :create, lote: { material_id: @lote.material_id, precio_compra: @lote.precio_compra, stock_actual_bar: @lote.stock_actual_bar, stock_actual_bodega: @lote.stock_actual_bodega, stock_actual_cocina: @lote.stock_actual_cocina, stock_original: @lote.stock_original, unidad_medida_id: @lote.unidad_medida_id }
    end

    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should show lote" do
    get :show, id: @lote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lote
    assert_response :success
  end

  test "should update lote" do
    patch :update, id: @lote, lote: { material_id: @lote.material_id, precio_compra: @lote.precio_compra, stock_actual_bar: @lote.stock_actual_bar, stock_actual_bodega: @lote.stock_actual_bodega, stock_actual_cocina: @lote.stock_actual_cocina, stock_original: @lote.stock_original, unidad_medida_id: @lote.unidad_medida_id }
    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should destroy lote" do
    assert_difference('Lote.count', -1) do
      delete :destroy, id: @lote
    end

    assert_redirected_to lotes_path
  end
end
