class CongresslistsController < ApplicationController
  def index
    @user = current_user
    @list = List.find(params[:list_id])
    @list.user = @user
    @congressmembers = Congressmember.all
  end

  def new
    @congresslist = Congresslist.new
    @user = current_user
    @list = List.find(params[:list_id])
    @congressmember =  Congressmember.first
    @congressmembers = Congressmember.order(:state)
  end

  def create
    @list = List.find(params[:list_id])
    @congressmember = Congressmember.find(params["congresslist"][:congressmember_id])
    @congresslist = Congresslist.new(list: @list, congressmember: @congressmember)
    @congresslists = Congresslist.where(list: @list)

    if @congresslists.any? { |c| c.congressmember == @congressmember }
      flash[:notice] = 'You already have that congressmember.'
      redirect_to list_path(@list)
    elsif @congresslist.save
      flash[:notice] = 'List added.'
      redirect_to list_path(@list)
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
    @list = List.find(params[:list_id])
    @congresslist = Congresslist.new(congresslist_params)
  end

  def edit
    @list = List.find(params[:list_id])
    @congresslist = @list.congresslists
  end

  def destroy
    @list = List.find(params[:list_id])
    @congressmember = Congressmember.find(params[:id])
    @congresslist = Congresslist.where(list: @list, congressmember: @congressmember)
    if @congresslist[0].delete
      flash[:notice] = "Congressmember deleted."
    else
      errors = ''
      @congresslist.errors.full_messages.each do |msg|
        errors += "#{msg}. "
      end
      flash[:notice] = errors
    end
    redirect_to list_path(@list)
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
