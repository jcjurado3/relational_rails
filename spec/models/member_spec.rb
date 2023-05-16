require "rails_helper"

RSpec.describe Member, type: :model do
  describe "validation" do 
    it {should belong_to :gym}
  end

  describe "class methods" do
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
      @member_5 = @gym_2.members.create!(name:   "Kelly Carter",
                                        age:                   39,
                                        monthly_dues:         139,
                                        program_type:    "3 days",
                                        active_member:      false)
                                        
    end
    it "#current_member" do
      expect(Member.current_member).to eq([@member_1, @member_2, @member_3, @member_4])
    end
  end
end