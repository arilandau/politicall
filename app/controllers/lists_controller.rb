class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)

    if @list.save
      flash[:notice] = 'List added successfully!'
      redirect_to @list
    else
      errors = ''
      @list.errors.full_messages.each do |msg|
        errors += "#{msg}. "
      end
      flash[:notice] = errors
      render 'new'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = Bar.find(params[:id])
    if @list.update_attributes(bars_params)
      @list.save
      flash[:notice] = 'List edited successfully!'
      redirect_to @list
    else
      flash[:notice] = @list.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete

    flash[:notice] = 'List deleted successfully!'
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :user)
  end
end
