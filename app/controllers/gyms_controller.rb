class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
    @member_count = @gym.count_members
  end
end