# frozen_string_literal: true
class UnidadesMedidaController < ApplicationController
  before_action :set_unidade_medida, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = UnidadeMedida.ransack(params[:q])
    @pagy, @unidades_medida = pagy(@q.result)
  end

  def new
    @unidade_medida = UnidadeMedida.new
  end

  def edit
  end

  def create
    @unidade_medida = UnidadeMedida.new(unidade_medida_params)

    if @unidade_medida.save
      redirect_to unidades_medida_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @unidade_medida.update(unidade_medida_params)
      redirect_to unidades_medida_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @unidade_medida.destroy
      redirect_to unidades_medida_url, notice: t('messages.deleted_successfully')
    else
      redirect_to unidades_medida_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_unidade_medida
    @unidade_medida = UnidadeMedida.find_by(id: params[:id])
    return redirect_to unidades_medida_path, alert: t('messages.not_found') unless @unidade_medida
  end

  def unidade_medida_params
    permitted_attributes = UnidadeMedida.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:unidade_medida).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to unidades_medida_path, alert: t('messages.not_found')
  end
end
