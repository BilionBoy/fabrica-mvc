# frozen_string_literal: true
class StatusOsController < ApplicationController
  before_action :set_status_o, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = StatusO.ransack(params[:q])
    @pagy, @status_os = pagy(@q.result)
  end

  def new
    @status_o = StatusO.new
  end

  def edit
  end

  def create
    @status_o = StatusO.new(status_o_params)

    if @status_o.save
      redirect_to status_os_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @status_o.update(status_o_params)
      redirect_to status_os_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @status_o.destroy
      redirect_to status_os_url, notice: t('messages.deleted_successfully')
    else
      redirect_to status_os_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_status_o
    @status_o = StatusO.find_by(id: params[:id])
    return redirect_to status_os_path, alert: t('messages.not_found') unless @status_o
  end

  def status_o_params
    permitted_attributes = StatusO.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:status_o).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to status_os_path, alert: t('messages.not_found')
  end
end
