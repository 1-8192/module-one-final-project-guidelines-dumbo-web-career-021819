# Adding a classes column to the spells table
class AddClassToSpellTable < ActiveRecord::Migration[5.0]
  def change
    add_column :spells, :classes, :string
  end
end
