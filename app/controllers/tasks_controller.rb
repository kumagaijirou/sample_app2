class TasksController < ApplicationController

  def create
    @task = Task.new(
      content: params[:content],
      bet_user_id: params[:bet_user_id],
      deadline_at: params[:deadline_at],
      amount_bet: params[:amount_bet],
      user_id: current_user.id
      )
    if @task.save
      redirect_to task_path(@task[:id])
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @tasks = Task.where(user_id: current_user.id).paginate(page: params[:page])
  end
  
  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @tasks = Task.all
  end
end

private

def task_params
  params.require(:task).permit(:content,:bet_user_id,:user_id,
                              :deadline_at,:amount_bet)
end