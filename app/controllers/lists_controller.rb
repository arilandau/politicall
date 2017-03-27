class ListsController < ApplicationController
  def index
    @user = current_user
    @lists = List.where(user: @user)
    @congressmembers = Congressmember.all
  end

  def show
    @list = List.find(params[:id])
    @congressmembers = @list.congressmembers(:name)
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.new
  end

  def create
    @list = List.new(name: params[:list][:name])
    @user = User.find(params[:user_id])
    @list.user = @user

    if @list.save
      flash[:notice] = 'List added.'
      redirect_to user_lists_path(@user)
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
    @user = current_user
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      @list.save
      flash[:notice] = 'List updated.'
      redirect_to lists_path
    else
      flash[:notice] = @list.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete

    flash[:notice] = 'List deleted successfully!'
    redirect_to user_lists_path(current_user)
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :user)
  end
end
