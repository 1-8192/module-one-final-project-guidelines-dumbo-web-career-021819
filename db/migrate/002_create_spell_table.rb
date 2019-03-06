# creating a spell table
class CreateSpellTable < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :description
      t.integer :level
      t.string :school
    end
  end
end
