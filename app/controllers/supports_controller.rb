class SupportsController < ApplicationController  
  def create
    @task = Task.find(params[:id]),
    @support = Support.new(
      task_id: @task.id,
      comment: params[:comment],
      user_id: current_user.id,
      support_fee: params[:support_fee]
    )
    if @support.save
      redirect_to suppert_index_path(@task[:id])
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @support = Support.new
  end


  def show
    @task = Task.find(params[:id])
    @support = Support.find(params[:id])
  end


  def Index
    @task = Task.find(params[:id])
    @support = Support.find(params[:id])
end

private

  def support_params
    params.require(:support).permit(:task_id,:comment,:support_fee)
  end
end
