require "rails_helper"

RSpec.describe "the gyms show page", type: :feature do

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

  it "has Gym show page with gym attributes" do

    visit "/gyms/#{@gym.id}"

    expect(page).to have_content(@gym.name)
    expect(page).to have_content(@gym.location)
    expect(page).to have_content(@gym.franchise_owner)
  end

  it "Has link at the top of the page for Member Index" do
    visit "/gyms/#{@gym.id}"

    expect(page.has_link?).to be(true)

    click_link("All Members")

    expect(page).to have_content("Member Name: #{@member_1.name}")
    expect(page).to have_content("Member Name: #{@member_2.name}")
    expect(page).to have_content("Member Name: #{@member_3.name}")

  end

  it "Has link at the top of the page for Gym Index" do
    visit "/gyms/#{@gym.id}"

    expect(page.has_link?).to be(true)

    click_link("All Gyms")

    expect(page).to have_content("#{@gym.name}")
    expect(page).to have_content("#{@gym_2.name}")

  end

  it "Has link to the Gym Members Page" do
    visit "/gyms/#{@gym.id}"

    expect(page.has_link?).to be(true)

    click_link("Active Members at the Gym")

    expect(page).to have_content("Member Name: #{@member_1.name}")
    expect(page).to have_content("Member Name: #{@member_2.name}")
    expect(page).to_not have_content("Member Name: #{@member_3.name}")
  end
end