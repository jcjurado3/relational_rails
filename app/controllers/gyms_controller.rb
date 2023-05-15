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
    Gym.create!(gym_params)
    redirect_to "/gyms"
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    @gym.update(gym_params)

    redirect_to "/gyms/#{@gym.id}"
  end

  private 
  def gym_params
    params.permit(:name, :location, :franchise_owner)
  end
end