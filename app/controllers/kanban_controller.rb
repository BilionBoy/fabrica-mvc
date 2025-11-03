class KanbanController < ApplicationController
  def index
    @ordem_servico = OrdemServico.new
    @columns = Column.includes(:tasks).order(:position)
  end
end
