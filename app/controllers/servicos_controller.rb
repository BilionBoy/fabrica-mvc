# frozen_string_literal: true
class ServicosController < ApplicationController
  before_action :set_servico, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Servico.ransack(params[:q])
    @pagy, @servicos = pagy(@q.result)
  end

  def new
    @servico = Servico.new
  end

  def edit
  end

  def create
    @servico = Servico.new(servico_params)

    if @servico.save
      redirect_to servicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @servico.update(servico_params)
      redirect_to servicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @servico.destroy
      redirect_to servicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to servicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_servico
    @servico = Servico.find_by(id: params[:id])
    return redirect_to servicos_path, alert: t('messages.not_found') unless @servico
  end

  def servico_params
    permitted_attributes = Servico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:servico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to servicos_path, alert: t('messages.not_found')
  end
end
