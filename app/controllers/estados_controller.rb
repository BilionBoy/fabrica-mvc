# frozen_string_literal: true
class EstadosController < ApplicationController
  before_action :set_estado, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Estado.ransack(params[:q])
    @pagy, @estados = pagy(@q.result)
  end

  def new
    @estado = Estado.new
  end

  def edit
  end

  def create
    @estado = Estado.new(estado_params)

    if @estado.save
      redirect_to estados_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @estado.update(estado_params)
      redirect_to estados_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @estado.destroy
      redirect_to estados_url, notice: t('messages.deleted_successfully')
    else
      redirect_to estados_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_estado
    @estado = Estado.find_by(id: params[:id])
    return redirect_to estados_path, alert: t('messages.not_found') unless @estado
  end

  def estado_params
    permitted_attributes = Estado.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:estado).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to estados_path, alert: t('messages.not_found')
  end
end
