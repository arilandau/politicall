class CongressmembersController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @congressmembers = Congressmember.all
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

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def congressmember_params
    params.require(:congressmember).permit(:name, :address, :phone_number, :url, :image_url, :city, :state, :zip, :term)
  end

end
