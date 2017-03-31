class Api::V1::CongressmembersController < ApiController
  def index
    render json: Congressmember.all
  end
end
