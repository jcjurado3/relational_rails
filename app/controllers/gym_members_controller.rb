class GymMembersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
  end
end