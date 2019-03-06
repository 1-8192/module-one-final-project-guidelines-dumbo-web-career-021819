# Changing the spellcasting column for classes
class ChangeSpellcastingColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :character_classes, :spellcasting, :string
  end
end
