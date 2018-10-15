class CongressmembersController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  before_action :set_congressmember, except: :index

  def index
    @congressmembers = if params[:term]
                         Congressmember.where('lower(full_name) LIKE ? OR lower(state) LIKE ? OR lower(party) LIKE ? OR next_election::varchar LIKE ?', "%#{params[:term].downcase}%", "%#{params[:term].downcase}%", "%#{params[:term].downcase}%", "%#{params[:term].to_s}%")
                       else
                         Congressmember.order(:state)
                       end
  end

  def show
  end

  def new
  end

  def create
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
  end

  def update
    if @congressmember.update_attributes(congressmember_params)
      flash[:notice] = 'Congressmember updated.'
      redirect_to @congressmember
    else
      flash[:notice] = @congressmember.errors.messages
      render action: 'edit'
    end
  end

  def destroy
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
    params.require(:congressmember).permit(:full_name, :party, :chamber, :leadership_role, :twitter_account, :facebook_account, :email, :url, :senority, :next_election, :phone, :state, :photo)
  end

  def set_congressmember
    @congressmember = case params[:action]
    when "show", "edit", "destroy"
      Congressmember.find(params[:id])
    when "new"
      Congressmember.new
    when "create"
      Congressmember.create(congressmember_params)
    when "update"
      Congressmember.find(params[:id]).tap { |c| c.assign_attributes(congressmember_params) }
    end
  end
end
