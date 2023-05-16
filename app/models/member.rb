class Member < ApplicationRecord
  belongs_to :gym

  def self.current_member
    Member.where("active_member = true")
  end
end