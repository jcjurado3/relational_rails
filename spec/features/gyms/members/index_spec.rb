require "rails_helper"

RSpec.describe "Gym Member Index Page" do
  it "can see each member that is associated with that gym with member attributes" do
    gym = Gym.create!(name:                     "HSD Fit",
    location:              "Boca Raton, FL",
    franchise_owner: "Carmine Scandura")

    member_1 = gym.members.create!(name:        "John House",
                                  age:                   52,
                                  monthly_dues:         199,
                                  program_type: "Unlimited",
                                  active_member:      true)
    member_2 = gym.members.create!(name:   "Michelle Wright",
                                  age:                   45,
                                  monthly_dues:         139,
                                  program_type:    "3 days",
                                  active_member:      true)

    visit "/gyms/#{gym.id}/members"  

    expect(page).to have_content(member_1.name)
    expect(page).to have_content(member_1.age)
    expect(page).to have_content(member_1.monthly_dues)
    expect(page).to have_content(member_1.program_type)
    expect(page).to have_content(member_1.active_member)

    expect(page).to have_content(member_2.name)
  end
end