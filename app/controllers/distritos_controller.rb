# frozen_string_literal: true
class DistritosController < ApplicationController
  before_action :set_distrito, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Distrito.ransack(params[:q])
    @pagy, @distritos = pagy(@q.result)
  end

  def new
    @distrito = Distrito.new
  end

  def edit
  end

  def create
    @distrito = Distrito.new(distrito_params)

    if @distrito.save
      redirect_to distritos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @distrito.update(distrito_params)
      redirect_to distritos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @distrito.destroy
      redirect_to distritos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to distritos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_distrito
    @distrito = Distrito.find_by(id: params[:id])
    return redirect_to distritos_path, alert: t('messages.not_found') unless @distrito
  end

  def distrito_params
    permitted_attributes = Distrito.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:distrito).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to distritos_path, alert: t('messages.not_found')
  end
end
