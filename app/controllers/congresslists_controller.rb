class CongresslistsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @lists = @user.lists
    @lists = @lists.order(:updated_at)
    @congressmembers = Congressmember.all
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @congresslist = Congresslist.new
    @congressmembers = Congressmember.all
  end

  def create
    @congresslist = Congresslist.new
    @user = User.find(params[:user_id])

    if @congresslist.save
      flash[:notice] = 'List added.'
      redirect_to user_lists_path(@user)
    else
      errors = ''
      @congresslist.errors.full_messages.each do |msg|
        errors += "#{msg}. "
      end
      flash[:notice] = errors
      render 'new'
    end
  end

  def update
  end

  def destroy
  end
end
