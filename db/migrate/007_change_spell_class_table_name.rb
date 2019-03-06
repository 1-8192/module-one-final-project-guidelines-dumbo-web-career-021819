# renaming the spell slots table
class ChangeSpellClassTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :spell_class, :spell_slot
  end
end
