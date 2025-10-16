# frozen_string_literal: true
class CategoriaProdutosController < ApplicationController
  before_action :set_categoria_produto, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = CategoriaProduto.ransack(params[:q])
    @pagy, @categoria_produtos = pagy(@q.result)
  end

  def new
    @categoria_produto = CategoriaProduto.new
  end

  def edit
  end

  def create
    @categoria_produto = CategoriaProduto.new(categoria_produto_params)

    if @categoria_produto.save
      redirect_to categoria_produtos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @categoria_produto.update(categoria_produto_params)
      redirect_to categoria_produtos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @categoria_produto.destroy
      redirect_to categoria_produtos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to categoria_produtos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_categoria_produto
    @categoria_produto = CategoriaProduto.find_by(id: params[:id])
    return redirect_to categoria_produtos_path, alert: t('messages.not_found') unless @categoria_produto
  end

  def categoria_produto_params
    permitted_attributes = CategoriaProduto.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:categoria_produto).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to categoria_produtos_path, alert: t('messages.not_found')
  end
end
