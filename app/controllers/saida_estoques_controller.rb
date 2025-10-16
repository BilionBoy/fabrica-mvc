# frozen_string_literal: true
class SaidaEstoquesController < ApplicationController
  before_action :set_saida_estoque, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = SaidaEstoque.ransack(params[:q])
    @pagy, @saida_estoques = pagy(@q.result)
  end

  def new
    @saida_estoque = SaidaEstoque.new
  end

  def edit
  end

  def create
    @saida_estoque = SaidaEstoque.new(saida_estoque_params)

    if @saida_estoque.save
      redirect_to saida_estoques_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @saida_estoque.update(saida_estoque_params)
      redirect_to saida_estoques_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @saida_estoque.destroy
      redirect_to saida_estoques_url, notice: t('messages.deleted_successfully')
    else
      redirect_to saida_estoques_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_saida_estoque
    @saida_estoque = SaidaEstoque.find_by(id: params[:id])
    return redirect_to saida_estoques_path, alert: t('messages.not_found') unless @saida_estoque
  end

  def saida_estoque_params
    permitted_attributes = SaidaEstoque.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:saida_estoque).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to saida_estoques_path, alert: t('messages.not_found')
  end
end
