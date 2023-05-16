class Member < ApplicationRecord
  belongs_to :gym

  def self.current_member
    Member.where("active_member = true")
  end

  def self.member_sort
    # require 'pry'; binding.pry
    Member.order(name: :asc)
  end
end