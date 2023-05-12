require "rails_helper"

RSpec.describe Member, type: :model do
  describe "validation" do 
    it {should belong_to :gym}
  end
end