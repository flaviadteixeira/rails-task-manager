class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # NEW-CREATE

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  # READ All
  def index
    @tasks = Task.all
  end

  # READ One
  def show; end

  # EDIT
  def edit; end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
  end

  # DESTROY
  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
