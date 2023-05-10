class AddMemberToGyms < ActiveRecord::Migration[7.0]
  def change
    add_reference :gyms, :member, null: false, foreign_key: true
  end
end
