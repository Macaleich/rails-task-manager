class TasksController < ApplicationController
  def tasks
    @tasks = Task.all
  end

  def create
    @tasks = Task.new(tasks_params)
    @tasks.save
  end

  def new
    @tasks = Task.new
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def delete
    @tasks = Task.find(params[:id])
    @tasks.destroy(tasks_params)
  end

  private
  def tasks_params
    params.require(:task).permit(:title, :details, :rating)
  end
end
