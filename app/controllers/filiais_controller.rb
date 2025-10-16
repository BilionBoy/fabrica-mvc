# frozen_string_literal: true
class FiliaisController < ApplicationController
  before_action :set_filial, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Filial.ransack(params[:q])
    @pagy, @filiais = pagy(@q.result)
  end

  def new
    @filial = Filial.new
  end

  def edit
  end

  def create
    @filial = Filial.new(filial_params)

    if @filial.save
      redirect_to filiais_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @filial.update(filial_params)
      redirect_to filiais_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @filial.destroy
      redirect_to filiais_url, notice: t('messages.deleted_successfully')
    else
      redirect_to filiais_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_filial
    @filial = Filial.find_by(id: params[:id])
    return redirect_to filiais_path, alert: t('messages.not_found') unless @filial
  end

  def filial_params
    permitted_attributes = Filial.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:filial).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to filiais_path, alert: t('messages.not_found')
  end
end
