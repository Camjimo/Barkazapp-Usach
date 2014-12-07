class EquivalenciaController < ApplicationController
  before_action :set_equivalencium, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @equivalencia = Equivalencium.all
    respond_with(@equivalencia)
  end

  def show
    redirect_to equivalencia_path
    #respond_with(@equivalencium)
  end

  def new
    @equivalencium = Equivalencium.new
    respond_with(@equivalencium)
  end

  def edit
  end

  def create
    @equivalencium = Equivalencium.new(equivalencium_params)
    @equivalencium.save
    TipoContenedor.find(@equivalencium.tipo_contenedor_id).update asignado: true
    respond_with(@equivalencium)
  end

  def update
    @equivalencium.update(equivalencium_params)
    respond_with(@equivalencium)
  end

  def destroy
    @equivalencium.destroy
    respond_with(@equivalencium)
  end

  private
    def set_equivalencium
      @equivalencium = Equivalencium.find(params[:id])
    end

    def equivalencium_params
      params.require(:equivalencium).permit(:cantidad, :unidad_medida_id, :tipo_contenedor_id)
    end
end
