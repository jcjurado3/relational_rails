require "rails_helper"

RSpec.describe Gym, type: :model do
  before(:each) do
    @gym = Gym.create!(name:                     "HSD Fit",
                      location:          "Boca Raton, FL",
                      franchise_owner: "Carmine Scandura")
    @gym_2 = Gym.create!(name:                     "HSD Fit",
                        location:          "Boca Raton, FL",
                        franchise_owner: "Carmine Scandura")
    @member_1 = @gym.members.create!(name:        "John House",
                                    age:                   52,
                                    monthly_dues:         199,
                                    program_type: "Unlimited",
                                    active_member:      true)
    @member_2 = @gym.members.create!(name:   "Michelle Wright",
                                    age:                   45,
                                    monthly_dues:         139,
                                    program_type:    "3 days",
                                    active_member:      true)
    @member_3 = @gym_2.members.create!(name:"Cristina Waterson",
                                      age:                   62,
                                      monthly_dues:         199,
                                      program_type: "Unlimited",
                                      active_member:      true)
    @member_4 = @gym_2.members.create!(name:   "Jamison Carter",
                                      age:                   35,
                                      monthly_dues:         139,
                                      program_type:    "3 days",
                                      active_member:      true)
  end

  describe "validation" do
    it {should have_many :members}
  end

  describe "Gym Index sorted by Most Recently Opened" do
    it "#sort_gym_by_open_date" do 
    expect(Gym.sort_gym_by_open_date).to eq(Gym.order(created_at: :desc))
    end
  end

  describe "Instance Method" do
    it "#count_members" do
      expect(@gym.count_members).to eq(2)
      expect(@gym_2.count_members).to eq(2)
    end
  end
end