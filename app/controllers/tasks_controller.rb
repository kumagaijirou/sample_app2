class TasksController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def create
    @task = Task.new(
      content: params[:content],
      bet_user_id: params[:bet_user_id],
      deadline_at: params[:deadline_at],
      amount_bet: params[:amount_bet],
      user_id: current_user.id,
      status: '実行中'
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
    @supports = @task.supports
  end

  def status_run
    @task = Task.find(params[:id])
    if @task.status == '実行中' && Time.now < @task.deadline_at
      @task.status = '成功'
    else
      @task.status = '失敗'
    end

    @task.save
    redirect_to task_path(@task[:id])
  end

  def candidate
    @task = Task.find(params[:id])
    if @task.bet_user_id == 1
      @task.bet_user_id = current_user.id
      @task.save
      redirect_to task_path(@task[:id])
    else
      logger.error('立候補できません')
    end
  end

  private

    def task_params
      params.require(:task).permit(:content,:bet_user_id,:user_id,
                                  :deadline_at,:amount_bet,:status, :image)
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other
      end
    end
end