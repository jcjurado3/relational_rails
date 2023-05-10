require "rails_helper"

RSpec.describe "gyms index page" do
  it "can see the name of each gyms record in the system" do
    gym_1 = Gym.create!(name:                     "HSD Fit",
                        location:              "Boca Raton, FL",
                        franchise_owner: "Carmine Scandura"
    )
    gym_2 = Gym.create!(name:   "High Speed Dirt Fitness",
                        location:        "Greenville, SC",
                        franchise_owner: "Richard Jurado"
    )
    gym_3 = Gym.create!(name:        "HSD Evolution Fit",
                        location:         "Leesburg, VA",
                        franchise_owner: "Ronald Jurado"
    )

    visit "/gyms"

    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_2.name)
    expect(page).to have_content(gym_3.name)
  end
end