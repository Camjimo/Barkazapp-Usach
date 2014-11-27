class UnidadMedidasController < ApplicationController
  before_action :set_unidad_medida, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @unidad_medidas = UnidadMedida.all
    respond_with(@unidad_medidas)
  end

  def show
    respond_with(@unidad_medida)
  end

  def new
    @unidad_medida = UnidadMedida.new
    respond_with(@unidad_medida)
  end

  def edit
  end

  def create
    @unidad_medida = UnidadMedida.new(unidad_medida_params)
    @unidad_medida.save
    respond_with(@unidad_medida)
  end

  def update
    @unidad_medida.update(unidad_medida_params)
    respond_with(@unidad_medida)
  end

  def destroy
    @unidad_medida.destroy
    respond_with(@unidad_medida)
  end

  private
    def set_unidad_medida
      @unidad_medida = UnidadMedida.find(params[:id])
    end

    def unidad_medida_params
      params.require(:unidad_medida).permit(:nombre, :simbolo)
    end
end
