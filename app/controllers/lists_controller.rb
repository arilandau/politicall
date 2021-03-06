class ListsController < ApplicationController
  before_action :set_list, except: :index
  def index
    @user = current_user
    @lists = List.where(user: @user)
    @congressmembers = Congressmember.all
  end

  def show
    @congressmembers = @list.congressmembers(:name)
  end

  def new
  end

  def create
    @user = current_user
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
  end

  def update
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
    @list.delete

    flash[:notice] = 'List deleted.'
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

  def set_list
    @list = case params[:action]
    when "show", "edit", "update", "destroy"
      List.find(params[:id])
    when "new"
      List.new
    when "create"
      List.new(name: params[:list][:name])
    end
  end
end
