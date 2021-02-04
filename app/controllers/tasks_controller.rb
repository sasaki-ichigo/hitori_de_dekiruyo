class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @child = Child.includes(:user)
  end

  def show
    @child = current_user.children
  end

  def new
    @child = Child.find(params[:child_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to child_path(@task.child)
    else
      render :new
    end
  end

  def edit
    @child = Child.find(params[:child_id])
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to child_path(@task.child)
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:task1, :task2, :task3, :task4, :task5, :task6 ).merge(child_id: params[:child_id])
  end

end

# binding.pry
# @task.errors
# @task.errors.full_messages
# bundle exec rspec spec/models/task_spec.rb