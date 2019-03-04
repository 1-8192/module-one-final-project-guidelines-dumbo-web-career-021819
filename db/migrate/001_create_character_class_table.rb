class CreateCharacterClassTable < ActiveRecord::Migration[5.0]
  def change
    create_table :character_classes do |t|
      t. string :class_name
      t.string :description
      t.integer :spellcasting
      t.integer :spell_slots_at_1
 end
end
end
