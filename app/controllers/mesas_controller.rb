class MesasController < ApplicationController
  before_action :set_mesa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @mesas = Mesa.all
    respond_with(@mesas)
  end

  def show
    respond_with(@mesa)
  end

  def new
    @mesa = Mesa.new
    respond_with(@mesa)
  end

  def edit
  end

  def create
    @mesa = Mesa.new(mesa_params)
    @mesa.save
    respond_with(@mesa)
  end

  def update
    @mesa.update(mesa_params)
    respond_with(@mesa)
  end

  def destroy
    @mesa.destroy
    respond_with(@mesa)
  end

  private
    def set_mesa
      @mesa = Mesa.find(params[:id])
    end

    def mesa_params
      params.require(:mesa).permit(:ocupada)
    end
end
