class AddGymToMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :gym, foreign_key: true
  end
end
