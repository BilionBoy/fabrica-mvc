# frozen_string_literal: true
class EntradasEstoqueController < ApplicationController
  before_action :set_entrada_estoque, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = EntradaEstoque.ransack(params[:q])
    @pagy, @entradas_estoque = pagy(@q.result)
  end

  def new
    @entrada_estoque = EntradaEstoque.new
  end

  def edit
  end

  def create
    @entrada_estoque = EntradaEstoque.new(entrada_estoque_params)

    if @entrada_estoque.save
      redirect_to entradas_estoque_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @entrada_estoque.update(entrada_estoque_params)
      redirect_to entradas_estoque_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @entrada_estoque.destroy
      redirect_to entradas_estoque_url, notice: t('messages.deleted_successfully')
    else
      redirect_to entradas_estoque_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_entrada_estoque
    @entrada_estoque = EntradaEstoque.find_by(id: params[:id])
    return redirect_to entradas_estoque_path, alert: t('messages.not_found') unless @entrada_estoque
  end

  def entrada_estoque_params
    permitted_attributes = EntradaEstoque.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:entrada_estoque).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to entradas_estoque_path, alert: t('messages.not_found')
  end
end
