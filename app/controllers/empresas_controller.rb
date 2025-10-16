# frozen_string_literal: true
class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Empresa.ransack(params[:q])
    @pagy, @empresas = pagy(@q.result)
  end

  def new
    @empresa = Empresa.new
  end

  def edit
  end

  def create
    @empresa = Empresa.new(empresa_params)

    if @empresa.save
      redirect_to empresas_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @empresa.update(empresa_params)
      redirect_to empresas_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @empresa.destroy
      redirect_to empresas_url, notice: t('messages.deleted_successfully')
    else
      redirect_to empresas_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_empresa
    @empresa = Empresa.find_by(id: params[:id])
    return redirect_to empresas_path, alert: t('messages.not_found') unless @empresa
  end

  def empresa_params
    permitted_attributes = Empresa.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:empresa).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to empresas_path, alert: t('messages.not_found')
  end
end
