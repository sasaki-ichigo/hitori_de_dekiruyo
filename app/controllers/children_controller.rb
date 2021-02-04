class ChildrenController < ApplicationController

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @task = Task.includes(:child)
    @child = Child.find(params[:id])
  end

  private

  def child_params
    params.require(:child).permit(:name, :tree_id).merge(user_id: current_user.id)
  end

end
