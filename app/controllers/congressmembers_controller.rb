class CongressmembersController < ApplicationController
  def index
    @congressmembers = Congressmember.all
  end
end
