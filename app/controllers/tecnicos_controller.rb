# frozen_string_literal: true
class TecnicosController < ApplicationController
  before_action :set_tecnico, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Tecnico.ransack(params[:q])
    @pagy, @tecnicos = pagy(@q.result)
  end

  def new
    @tecnico = Tecnico.new
  end

  def edit
  end

  def create
    @tecnico = Tecnico.new(tecnico_params)

    if @tecnico.save
      redirect_to tecnicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tecnico.update(tecnico_params)
      redirect_to tecnicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tecnico.destroy
      redirect_to tecnicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to tecnicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_tecnico
    @tecnico = Tecnico.find_by(id: params[:id])
    return redirect_to tecnicos_path, alert: t('messages.not_found') unless @tecnico
  end

  def tecnico_params
    permitted_attributes = Tecnico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:tecnico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to tecnicos_path, alert: t('messages.not_found')
  end
end
