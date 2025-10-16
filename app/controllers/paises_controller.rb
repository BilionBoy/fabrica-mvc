# frozen_string_literal: true
class PaisesController < ApplicationController
  before_action :set_pais, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Pais.ransack(params[:q])
    @pagy, @paises = pagy(@q.result)
  end

  def new
    @pais = Pais.new
  end

  def edit
  end

  def create
    @pais = Pais.new(pais_params)

    if @pais.save
      redirect_to paises_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pais.update(pais_params)
      redirect_to paises_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @pais.destroy
      redirect_to paises_url, notice: t('messages.deleted_successfully')
    else
      redirect_to paises_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_pais
    @pais = Pais.find_by(id: params[:id])
    return redirect_to paises_path, alert: t('messages.not_found') unless @pais
  end

  def pais_params
    permitted_attributes = Pais.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:pais).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to paises_path, alert: t('messages.not_found')
  end
end
