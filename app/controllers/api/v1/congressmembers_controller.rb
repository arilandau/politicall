class Api::V1::CongressmembersController < ApplicationController
  def index
    render json: Congressmember.all
  end
end
