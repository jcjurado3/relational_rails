require "rails_helper"

RSpec.describe "the gyms show page", type: :feature do
  it "has Gym show page with gym attributes" do
    gym_1 = Gym.create!(name:                     "HSD Fit",
                        location:              "Boca Raton, FL",
                        franchise_owner: "Carmine Scandura"
    )

    visit "/gyms/#{gym_1.id}"

    expect(page).to have_content(gym_1.name)
    expect(page).to have_content(gym_1.location)
    expect(page).to have_content(gym_1.franchise_owner)
  end
end