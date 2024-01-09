class TasksController < ApplicationController

  def create
    @tasks = Task.new(
      task_content: params[:task_content],
      task_bet_user_ID: params[:task_bet_user_ID],
      task_deadline_at: params[:task_deadline_at],
      Amount_bet: params[:Amount_bet],
      task_user_ID: current_user.id
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
  params.require(:task).permit(:task_content,:task_bet_user_id,:task_user_id,
                              :task_deadline_at,:Amount_bet)
end