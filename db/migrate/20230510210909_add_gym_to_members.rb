class AddGymToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :gym, :string
    add_column :members, :references, :string
  end
end
