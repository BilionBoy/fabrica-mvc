# frozen_string_literal: true
class StatusEmpresasController < ApplicationController
  before_action :set_status_empresa, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = StatusEmpresa.ransack(params[:q])
    @pagy, @status_empresas = pagy(@q.result)
  end

  def new
    @status_empresa = StatusEmpresa.new
  end

  def edit
  end

  def create
    @status_empresa = StatusEmpresa.new(status_empresa_params)

    if @status_empresa.save
      redirect_to status_empresas_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @status_empresa.update(status_empresa_params)
      redirect_to status_empresas_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @status_empresa.destroy
      redirect_to status_empresas_url, notice: t('messages.deleted_successfully')
    else
      redirect_to status_empresas_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_status_empresa
    @status_empresa = StatusEmpresa.find_by(id: params[:id])
    return redirect_to status_empresas_path, alert: t('messages.not_found') unless @status_empresa
  end

  def status_empresa_params
    permitted_attributes = StatusEmpresa.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:status_empresa).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to status_empresas_path, alert: t('messages.not_found')
  end
end
