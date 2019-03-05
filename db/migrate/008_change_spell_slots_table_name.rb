class ChangeSpellSlotsTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :spell_slot, :spell_slots
  end
end
