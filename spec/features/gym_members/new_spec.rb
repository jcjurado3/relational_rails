require "rails_helper"

RSpec.describe "Create Member" do
  before(:each) do
    @gym = Gym.create!(name:                     "HSD Fit",
                      location:          "Boca Raton, FL",
                      franchise_owner: "Carmine Scandura")
  end
    it "should create new member" do
      visit "/gyms/#{@gym.id}/members/new"

      fill_in "member[name]", with: "Breanna Jurado"
      fill_in "member[age]", with: 31
      fill_in "member[monthly_dues]", with: 199
      fill_in "member[program_type]", with: "Unlimited"
      fill_in "member[active_member]", with: true
      click_on("submit")

      expect(page).to have_current_path("/gyms/#{@gym.id}/members")
      expect(page).to have_content("Breanna Jurado")

    end
end