class Gym < ApplicationRecord
  has_many :members

  def self.sort_gym_by_open_date
    order(created_at: :desc)
  end

  def count_members
    self.members.count
  end

  
end