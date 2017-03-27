class CongresslistsController < ApplicationController
  def index
    @user = current_user
    @list = List.find(params[:list_id])
    @list.user = @user
    @congressmembers = Congressmember.all
  end

  def new
    @user = current_user
    @congresslist = Congresslist.new
    @list = List.find(params[:list_id])
    @congressmembers = Congressmember.order(:state)
  end

  def create
    @list = List.find(params[:list_id])
    @congresslist = Congresslist.new(congresslist_params)
    @congressmembers = Congressmember.order(:state)

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

  def edit
  end

  def destroy
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def congresslist_params
    params.require(:congresslist).permit(:congressmember_id, :list_id)
  end
end
