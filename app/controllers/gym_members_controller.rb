class GymMembersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.find(params[:id])
  end

  def create
    gym = Gym.find(params[:id])
    member = gym.members.create!(member_params)

    redirect_to "/gyms/#{gym.id}/members"
  end

  private

  def member_params
    params.permit(:name, :age, :monthly_dues, :program_type, :active_member)
  end
end