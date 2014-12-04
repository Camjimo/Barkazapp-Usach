class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @materials = Material.all
    respond_with(@materials)
  end

  def show
    #respond_with(@material)
    redirect_to materials_path
  end

  def new
    @material = Material.new
    respond_with(@material)
  end

  def edit
  end

  def create
    @materials = Material.new(material_params)
    @materials.save
    respond_with(@material)
  end

  def update
    @material.update(material_params)
    respond_with(@material)
  end

  def destroy
    @material.destroy
    respond_with(@material)
  end

  private
    def set_material
      @material = Material.find(params[:id])
    end

    def material_params
      params.require(:material).permit(:nombre, :pmp, :cantidad, :tipo_material_id, :unidad_medida_id)
    end
end
