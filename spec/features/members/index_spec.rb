require "rails_helper"

RSpec.describe "member index page", type: :feature do

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

  it "can display each member in the system with their attributes" do

    visit "/members"

    expect(page).to have_content(@member_1.name)
    expect(page).to have_content(@member_1.age)
    expect(page).to have_content(@member_1.monthly_dues)
    expect(page).to have_content(@member_1.program_type)
    expect(page).to have_content(@member_1.active_member)
                      
    expect(page).to have_content(@member_2.name)
    expect(page).to have_content(@member_2.age)
    expect(page).to have_content(@member_2.monthly_dues)
    expect(page).to have_content(@member_2.program_type)
    expect(page).to have_content(@member_2.active_member)
  end

  it "Has link at the top of the page for Member Index" do
    visit "/members"

    expect(page).to have_link("All Members")

    click_link("All Members")

    expect(page).to have_content("Member Name: #{@member_1.name}")
    expect(page).to have_content("Member Name: #{@member_2.name}")
    expect(page).to have_content("Member Name: #{@member_3.name}")

  end

  it "Has link at the top of the page for Gym Index" do
    visit "/members"

    expect(page).to have_link("All Gyms")

    click_link("All Gyms")

    expect(page).to have_content("#{@gym.name}")
    expect(page).to have_content("#{@gym_2.name}")
  end

  it "Member Index only shows true Records" do
    visit "/members"

    expect(page).to have_content("Member Name: #{@member_1.name}")
    expect(page).to have_content("Member Name: #{@member_2.name}")
    expect(page).to have_content("Member Name: #{@member_3.name}")
    expect(page).to_not have_content("Member Name: #{@member_5.name}")

  end

end