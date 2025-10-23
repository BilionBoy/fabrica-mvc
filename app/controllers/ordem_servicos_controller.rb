# frozen_string_literal: true
class OrdemServicosController < ApplicationController
  before_action :set_ordem_servico, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OrdemServico.ransack(params[:q])
    @pagy, @ordem_servicos = pagy(@q.result)
  end

  def new
    @ordem_servico = OrdemServico.new
  end

  def edit
  end

  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)

    if @ordem_servico.save
      redirect_to ordem_servicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ordem_servico.update(ordem_servico_params)
      redirect_to ordem_servicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @ordem_servico.destroy
      redirect_to ordem_servicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to ordem_servicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_ordem_servico
    @ordem_servico = OrdemServico.find_by(id: params[:id])
    return redirect_to ordem_servicos_path, alert: t('messages.not_found') unless @ordem_servico
  end

  def ordem_servico_params
    permitted_attributes = OrdemServico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:ordem_servico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to ordem_servicos_path, alert: t('messages.not_found')
  end
end
