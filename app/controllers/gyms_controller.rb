class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
    @member_count = @gym.count_members
  end

  def new

  end

  def create
    gym = Gym.new({
      name: params[:gym][:name],
      location: params[:gym][:location],
      franchise_owner: params[:gym][:franchise_owner]
    })
    gym.save
    redirect_to "/gyms"
  end
end