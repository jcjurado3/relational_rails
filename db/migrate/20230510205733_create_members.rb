class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.integer :monthly_dues
      t.string :program_type
      t.boolean :active_member

      t.timestamps
    end
  end
end
