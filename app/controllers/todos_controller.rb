class TodosController < ApplicationController  ## Again basing this on the master template

  def show 
    @todo = Todo.find(params[:id])             ## Assign the Todo obj to instance (@) var
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save                                        ## if the save is successful
      flash[:notice] = 'Your To-Do item was successfully created!'  ## add msg to flash
      redirect_to todo_path(@todo)                       ## use prefix for todos#show
    else                                                 ## if the save is unsuccessful
      render 'new'                                       ## show same form if db refuses
    end
  end

  private                                                ## THIS CONTROLLER ONLY
    def todo_params
      params.require(:todo).permit(:name, :description)  ## whitelisting params fields
    end

end
