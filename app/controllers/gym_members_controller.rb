class GymMembersController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @members = @gym.members
    if params[:sort] == "true"
      @members = @members.member_sort
    else
      @members
    end
  end

  def new
    @gym = Gym.find(params[:id])
  end

  def create
    gym = Gym.find(params[:id])
    member = gym.members.create!(member_params)

    redirect_to "/gyms/#{gym.id}/members"
  end

  # def member_sort(sort)
  #   if sort == "true"
  #     return members.order(:name)
  #   else
  #     members
  #   end
  # end

  private

  def member_params
    params.permit(:name, :age, :monthly_dues, :program_type, :active_member)
  end
end