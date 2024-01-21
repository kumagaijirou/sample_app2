class TasksController < ApplicationController

  def create
    @tasks = Task.new(
      content: params[:content],
      bet_user_id: params[:bet_user_id],
      deadline_at: params[:deadline_at],
      amount_bet: params[:amount_bet],
      user_id: current_user.id
      )
    if @tasks.save
      redirect_to tasks_path(@task[:ID])
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @tasks = Task.new
  end

  def show
    @tasks = Task.find(params[:id])
    #@tasks = Task.all
  end
end

private

def task_params
  params.require(:task).permit(:content,:bet_user_id,:user_id,
                              :deadline_at,:amount_bet)
end