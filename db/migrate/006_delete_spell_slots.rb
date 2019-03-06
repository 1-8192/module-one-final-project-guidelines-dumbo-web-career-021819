# Deleting the spell slot column for classes.
class DeleteSpellSlots < ActiveRecord::Migration[5.0]
  def change
    remove_column :character_classes, :spell_slots_at_1
  end
end
