require "rails_helper"

RSpec.describe "member show page", type: :feature do

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

  it "will display the member with that ID with attributes" do

    visit "/members/#{@member_1.id}"

    expect(page).to have_content(@member_1.name)
    expect(page).to have_content(@member_1.age)
    expect(page).to have_content(@member_1.monthly_dues)
    expect(page).to have_content(@member_1.program_type)
    expect(page).to have_content(@member_1.active_member)

    expect(page).to_not have_content(@member_2.name)
  end

  it "Has link at the top of the page for Member Index" do
    
    visit "/members/#{@member_1.id}"

    expect(page.has_link?).to be(true)

    click_link("All Members")

    expect(page).to have_content("Member Name: #{@member_1.name}")
    expect(page).to have_content("Member Name: #{@member_2.name}")
    expect(page).to have_content("Member Name: #{@member_3.name}")

  end
end