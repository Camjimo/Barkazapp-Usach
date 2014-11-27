class CatalogoMaterialsController < ApplicationController
  before_action :set_catalogo_material, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @catalogo_materials = CatalogoMaterial.all
    respond_with(@catalogo_materials)
  end

  def show
    respond_with(@catalogo_material)
  end

  def new
    @catalogo_material = CatalogoMaterial.new
    respond_with(@catalogo_material)
  end

  def edit
  end

  def create
    @catalogo_material = CatalogoMaterial.new(catalogo_material_params)
    @catalogo_material.save
    respond_with(@catalogo_material)
  end

  def update
    @catalogo_material.update(catalogo_material_params)
    respond_with(@catalogo_material)
  end

  def destroy
    @catalogo_material.destroy
    respond_with(@catalogo_material)
  end

  private
    def set_catalogo_material
      @catalogo_material = CatalogoMaterial.find(params[:id])
    end

    def catalogo_material_params
      params.require(:catalogo_material).permit(:cantidad_material, :precio_material, :material_id, :unidad_medida_id, :proveedor_id)
    end
end
