require "rails_helper"

RSpec.describe "Edit Gym" do
  describe "As a visitor" do
    it "can update a gym object" do
      gym = Gym.create!(name:                     "HSD Fit",
                        location:          "Boca Raton, FL",
                        franchise_owner: "Carmine Scandura")

      visit "/gyms/#{gym.id}"

      click_link "Edit Gym"

      expect(current_path).to eq("/gyms/#{gym.id}/edit")

      fill_in "Name", with: "Orange Theory"
      fill_in "Location", with: "Boynton Beach, FL"
      fill_in "Franchise Owner", with: "Jimmy Jurado"

      expect(current_path).to eq("/gyms/#{gym.id}")
      expect(page).to have_content("Orange Theory")
      expect(page).to have_content("Boynton Beach, FL")
      expect(page).to have_content("Jimmy Jurado")

    end
  end
end