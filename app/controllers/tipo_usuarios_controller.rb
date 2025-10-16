# frozen_string_literal: true
class TipoUsuariosController < ApplicationController
  before_action :set_tipo_usuario, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = TipoUsuario.ransack(params[:q])
    @pagy, @tipo_usuarios = pagy(@q.result)
  end

  def new
    @tipo_usuario = TipoUsuario.new
  end

  def edit
  end

  def create
    @tipo_usuario = TipoUsuario.new(tipo_usuario_params)

    if @tipo_usuario.save
      redirect_to tipo_usuarios_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tipo_usuario.update(tipo_usuario_params)
      redirect_to tipo_usuarios_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tipo_usuario.destroy
      redirect_to tipo_usuarios_url, notice: t('messages.deleted_successfully')
    else
      redirect_to tipo_usuarios_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_tipo_usuario
    @tipo_usuario = TipoUsuario.find_by(id: params[:id])
    return redirect_to tipo_usuarios_path, alert: t('messages.not_found') unless @tipo_usuario
  end

  def tipo_usuario_params
    permitted_attributes = TipoUsuario.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:tipo_usuario).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to tipo_usuarios_path, alert: t('messages.not_found')
  end
end
