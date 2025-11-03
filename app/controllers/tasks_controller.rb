class TasksController < ApplicationController
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      render json: { success: true, task: @task }, status: :ok
    else
      render json: { success: false, errors: @task.errors }, status: :unprocessable_entity
    end
  end

  def new
    @column_id = params[:column_id]
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.column_id = params[:column_id]
    
    
    if @task.save
      render json: { 
        success: true, 
        task: @task,
        html: render_to_string(partial: 'task', locals: { task: @task })
      }, status: :created
    else
      render json: { success: false, errors: @task.errors }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :column_id, :status)
  end
end
