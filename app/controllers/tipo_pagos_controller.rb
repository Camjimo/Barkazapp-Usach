class TipoPagosController < ApplicationController
  before_action :set_tipo_pago, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tipo_pagos = TipoPago.all
    respond_with(@tipo_pagos)
  end

  def show
    #respond_with(@tipo_pago)
    redirect_to tipo_pagos_path
  end

  def new
    @tipo_pago = TipoPago.new
    respond_with(@tipo_pago)
  end

  def edit
  end

  def create
    @tipo_pago = TipoPago.new(tipo_pago_params)
    @tipo_pago.save
    respond_with(@tipo_pago)
  end

  def update
    @tipo_pago.update(tipo_pago_params)
    respond_with(@tipo_pago)
  end

  def destroy
    @tipo_pago.destroy
    respond_with(@tipo_pago)
  end

  private
    def set_tipo_pago
      @tipo_pago = TipoPago.find(params[:id])
    end

    def tipo_pago_params
      params.require(:tipo_pago).permit(:nombre)
    end
end
