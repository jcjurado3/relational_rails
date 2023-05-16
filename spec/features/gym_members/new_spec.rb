require "rails_helper"

RSpec.describe "Create Member" do
  before(:each) do
    @gym = Gym.create!(name:                     "HSD Fit",
                      location:          "Boca Raton, FL",
                      franchise_owner: "Carmine Scandura")
  end
    it "should create new member" do
      visit "/gyms/#{@gym.id}/members/new"

      fill_in "Name", with: "Breanna Jurado"
      fill_in "Age", with: 31
      fill_in "Monthly", with: 199
      fill_in "Program Type", with: "Unlimited"
      fill_in "Active Membership", with: true
      click_on("Create Member")

      expect(page).to have_current_path("/gyms/#{@gym.id}/members")
      expect(page).to have_content("Breanna Jurado")

    end
end