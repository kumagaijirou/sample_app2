class TasksController < ApplicationController

  def create
    @task = Task.new(
      content: params[:content],
      bet_user_id: params[:bet_user_id],
      deadline_at: params[:deadline_at],
      amount_bet: params[:amount_bet],
      user_id: current_user.id,
      status: 'running'
      )
    if @task.save
      redirect_to task_path(@task[:id])
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @tasks = Task.where(user_id: current_user.id).paginate(page: params[:page])
    @task = Task.find_by(id: params[:id])
  end
  
  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end
end

  #def status_ran
  #  if @task.status == 'ranning' && Time.now < @task.deadline_at
  #    button_to "実行完了", {controller: 'task', action: 'success'}, {method: :post}
  #  else
  #      @task.status = '失敗'
        #@task.save
  #  end
  #end

  def success
    @task.status = '成功'
    #@task.save
    render 'task.show', status: @task = Task.find(params[:id])
    puts "task.status"
  end

private

def task_params
  params.require(:task).permit(:content,:bet_user_id,:user_id,
                              :deadline_at,:amount_bet,:status)
end