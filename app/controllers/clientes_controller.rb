# frozen_string_literal: true
class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Cliente.ransack(params[:q])
    @pagy, @clientes = pagy(@q.result)
  end

  def new
    @cliente = Cliente.new
    @cliente.enderecos.build
    @cliente.telefones.build
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to clientes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cliente.update(cliente_params)
      redirect_to clientes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @cliente.destroy
      redirect_to clientes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to clientes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  def search
    query = params[:q].to_s.strip
    @clientes = Cliente.where("nome ILIKE ?", "%#{query}%").limit(10)

    render json: @clientes.pluck(:nome)
  end
  private

  def set_cliente
    @cliente = Cliente.find_by(id: params[:id])
    return redirect_to clientes_path, alert: t('messages.not_found') unless @cliente
  end

  def cliente_params
    permitted_attributes = Cliente.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:cliente).permit(permitted_attributes.map(&:to_sym),
    enderecos_attributes: [:id, :logradouro, :numero, :bairro, :cidade, :uf, :cep, :_destroy],
    telefones_attributes: [:id, :tipo, :numero, :_destroy])
  end

  def handle_not_found
    redirect_to clientes_path, alert: t('messages.not_found')
  end
end
