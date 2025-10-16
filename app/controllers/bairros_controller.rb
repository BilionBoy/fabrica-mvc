# frozen_string_literal: true
class BairrosController < ApplicationController
  before_action :set_bairro, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Bairro.ransack(params[:q])
    @pagy, @bairros = pagy(@q.result)
  end

  def new
    @bairro = Bairro.new
  end

  def edit
  end

  def create
    @bairro = Bairro.new(bairro_params)

    if @bairro.save
      redirect_to bairros_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bairro.update(bairro_params)
      redirect_to bairros_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @bairro.destroy
      redirect_to bairros_url, notice: t('messages.deleted_successfully')
    else
      redirect_to bairros_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_bairro
    @bairro = Bairro.find_by(id: params[:id])
    return redirect_to bairros_path, alert: t('messages.not_found') unless @bairro
  end

  def bairro_params
    permitted_attributes = Bairro.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:bairro).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to bairros_path, alert: t('messages.not_found')
  end
end
