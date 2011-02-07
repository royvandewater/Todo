class TodoListsController < ApplicationController
  before_filter :find_todo_list, :except => [:index, :new, :create]
  respond_to :html, :json

  def index
    @todo_lists = current_user.todo_lists

    respond_with @todo_lists
  end

  def show
    respond_with @todo_list
  end

  def new
    @todo_list = current_user.todo_lists.build

    respond_with @todo_list
  end

  def edit
  end

  def create
    @todo_list = current_user.todo_lists.build(params[:todo_list])

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to(@todo_list, :notice => 'Todo list was successfully created.') }
        format.json  { render :json => @todo_list, :status => :created, :location => @todo_list }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @todo_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_list.update_attributes(params[:todo_list])
        format.html { redirect_to(@todo_list, :notice => 'Todo list was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @todo_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_list.destroy

    respond_to do |format|
      format.html { redirect_to(todo_lists_url) }
      format.json  { head :ok }
    end
  end

  protected
  def find_todo_list
    @todo_list = current_user.todo_lists.find(params[:id])
  end
end
