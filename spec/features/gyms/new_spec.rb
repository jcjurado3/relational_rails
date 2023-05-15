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

  scenario "should create new Gym" do
    visit "/gyms"

    expect(page.has_link?).to be(true)
    expect(page).to have_content("New Gym")

    click_link("New Gym")

    fill_in "gym[name]", with: 'Evolution Fitness'
    fill_in "gym[location]", with: 'Greenville, SC'
    fill_in "gym[franchise_owner]", with: 'Jimmy Jurado'
    click_on("submit")

    expect(page).to have_current_path("/gyms")

    expect(page).to have_content("Evolution Fitness")
  end
end