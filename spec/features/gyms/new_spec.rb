require "rails_helper"

RSpec.describe "Creating new Gym" do
  before(:each) do
    @gym = Gym.create!(name:                     "HSD Fit",
                      location:          "Boca Raton, FL",
                      franchise_owner: "Carmine Scandura")
    @gym_2 = Gym.create!(name: "High Speed Dirt Fitness",
                        location:         "Leesburg, VA",
                        franchise_owner: "Richard Jurado")
  end

  it "should create new Gym" do
    visit "/gyms"

    expect(page).to have_link("New Gym")

    click_link("New Gym")

    fill_in "Name", with: 'Evolution Fitness'
    fill_in "Location", with: 'Greenville, SC'
    fill_in "Franchise owner", with: 'Jimmy Jurado'
    click_on("Create Gym")

    expect(page).to have_current_path("/gyms")

    expect(page).to have_content("Evolution Fitness")
  end
end