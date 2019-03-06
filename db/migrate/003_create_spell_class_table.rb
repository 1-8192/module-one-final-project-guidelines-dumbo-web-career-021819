# creating the join table for spells and classes
class CreateSpellClassTable < ActiveRecord::Migration[5.0]
  def change
    create_table :spell_class do |t|
    t.integer :spell_id
    t.integer :character_class_id
    end
  end
end
