class Gym < ApplicationRecord
  has_many :members

  def self.sort_gym_by_open_date
    order(:created_at)
  end
end