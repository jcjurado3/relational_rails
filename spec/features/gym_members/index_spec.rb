require "rails_helper"

RSpec.describe "Gym Member Index Page" do
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
    @member_5 = @gym.members.create!(name:     "Abigal Lewis",
                                      age:                   35,
                                      monthly_dues:         139,
                                      program_type:    "3 days",
                                      active_member:      true)
  end

  it "can see each member that is associated with that gym with member attributes" do
    visit "/gyms/#{@gym.id}/members"  

    expect(page).to have_content(@member_1.name)
    expect(page).to have_content(@member_1.age)
    expect(page).to have_content(@member_1.monthly_dues)
    expect(page).to have_content(@member_1.program_type)
    expect(page).to have_content(@member_1.active_member)

    expect(page).to have_content(@member_2.name)
  end

  it "Has link at the top of the page for Member Index" do
    visit "/gyms/#{@gym.id}/members"  

    expect(page.has_link?).to be(true)

    click_link("All Members")

    expect(page).to have_content("Member Name: #{@member_1.name}")
    expect(page).to have_content("Member Name: #{@member_2.name}")
    expect(page).to have_content("Member Name: #{@member_3.name}")

  end

  it "Has link at the top of the page for Gym Index" do
    visit "/gyms/#{@gym.id}/members" 

    expect(page.has_link?).to be(true)

    click_link("All Gyms")

    expect(page).to have_content("#{@gym.name}")
    expect(page).to have_content("#{@gym_2.name}")
  end

  it "has link to create member in Gym Member Index" do
    visit "/gyms/#{@gym_2.id}/members" 

    click_link("Create Member")

    expect(current_path).to eq("/gyms/#{@gym_2.id}/members/new")
  end

  it "has link to sort member in alphabetical order" do
    visit "/gyms/#{@gym.id}/members" 

    expect(@member_1.name).to appear_before(@member_2.name)
    expect(@member_2.name).to appear_before(@member_5.name)
    expect(page).to have_link("Sort Alphabetically")

    click_link("Sort Alphabetically")

    expect(current_path).to eq("/gyms/#{@gym.id}/members")

    expect(@member_5.name).to appear_before(@member_1.name)
    expect(@member_5.name).to appear_before(@member_2.name)
  end
end