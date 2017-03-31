class CongressmembersController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @congressmembers = Congressmember.order(:state)

  end

  def show
    @congressmember = Congressmember.find(params[:id])
  end

  def new
    @congressmember = Congressmember.new
  end

  def create
    @congressmember = Congressmember.create(congressmember_params)

    if @congressmember.save
      flash[:notice] = 'Congressmember added successfully!'
      redirect_to @congressmember
    else
      errors = ''
      @congressmember.errors.full_messages.each do |msg|
        errors += "#{msg}. "
      end
      flash[:notice] = errors
      render 'new'
    end
  end

  def edit
    @congressmember = Congressmember.find(params[:id])
  end

  def update
    @congressmember = Congressmember.find(params[:id])
    if @congressmember.update_attributes(congressmember_params)
      flash[:notice] = 'Congressmember updated.'
      redirect_to @congressmember
    else
      flash[:notice] = @congressmember.errors.messages
      render action: 'edit'
    end
  end

  def destroy
    @congressmember = Congressmember.find(params[:id])
    @congressmember.delete

    flash[:notice] = 'Congressmember deleted.'
    redirect_to root_path
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def congressmember_params
    params.require(:congressmember).permit(:first_name, :middle_name, :last_name, :party, :chamber, :leadership_role, :twitter_account, :facebook_account, :email, :url, :senority, :next_election, :phone, :state, :photo)
  end
end
