class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todo_path(@todo), notice: 'Todo was successfully created.'
    else
      render json: { errors: @todo.errors, status: :unprocessable_entity }
    end
  end

  def index
    @todos = Todo.all
  end

  def active_todos
    @todos = Todo.where(status: :active)
  end

  def completed_todos
    @todos = Todo.where(status: :completed)
  end

  def new
    @todo = Todo.new
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :status)
  end

  def set_todo
      @todo = Todo.find(params[:id])
    end
end
