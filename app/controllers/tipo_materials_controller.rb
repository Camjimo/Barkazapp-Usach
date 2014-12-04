class TipoMaterialsController < ApplicationController
  before_action :set_tipo_material, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tipo_materials = TipoMaterial.all
    respond_with(@tipo_materials)
  end

  def show
    #respond_with(@tipo_material)
    redirect_to tipo_materials_path
  end

  def new
    @tipo_material = TipoMaterial.new
    respond_with(@tipo_material)
  end

  def edit
  end

  def create
    @tipo_material = TipoMaterial.new(tipo_material_params)
    @tipo_material.save
    respond_with(@tipo_material)
  end

  def update
    @tipo_material.update(tipo_material_params)
    respond_with(@tipo_material)
  end

  def destroy
    @tipo_material.destroy
    respond_with(@tipo_material)
  end

  private
    def set_tipo_material
      @tipo_material = TipoMaterial.find(params[:id])
    end

    def tipo_material_params
      params.require(:tipo_material).permit(:nombre)
    end
end
