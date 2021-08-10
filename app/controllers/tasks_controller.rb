class TasksController < ApplicationController
  def index
    @lists = Task.all
  end

  def show
    @lists = Task.all
    @list = @lists.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
      @task = Task.new(task_params)
      if @task.save
        # @task.save
        redirect_to task_path(@task)
      else
        render 'tasks/new'
      end
  end

  def edit
    @tasks = Task.all
    @task = @tasks.find(params[:id])
  end

  def update
    @lists = Task.all
    @list = @lists.find(params[:id])
    if @list.update(task_params)
      redirect_to task_path(@list)
    else
      # render 'edit.html.erb'
      render :edit
    end
  end

  def destroy
    @lists = Task.all
    @list = @lists.find(params[:id])
    @list.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
