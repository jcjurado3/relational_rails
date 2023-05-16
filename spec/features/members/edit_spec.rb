require "rails_helper"

RSpec.describe "Member Edit Page" do
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

  it "has form to edit existing member details" do
    visit "/members/#{@member_1.id}/edit"

    expect(page).to have_button("Update Member")

    fill_in("Age", with: 53)
    fill_in("Monthly Dues", with: 139)
    fill_in("Program Type", with: "3 Days")
    
    click_button("Update Member")

    expect(current_path).to eq("/members/#{@member_1.id}")
    expect(page).to have_content("3 Days")
  end
end