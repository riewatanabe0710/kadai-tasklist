class TasksController < ApplicationController
  def index
    @Tasks = Task.all
  end

  def show
    @Task = Task.find(params[:id])
  end

  def new
    @Task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    @Task = Task.find(params[:id])
  end

  def update
    @Task = Task.find(params[:id])

    if @Task.update(task_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @Task
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @Task = Task.find(params[:id])
    @Task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to task_url
  end
  
   private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end

