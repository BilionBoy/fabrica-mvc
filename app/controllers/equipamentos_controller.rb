class EquipamentosController < ApplicationController

  def index
    @q = Cliente.ransack(params[:q])
    @pagy, @clientes = pagy(@q.result)
  end 
end
