class CharacterClass < ActiveRecord::Base
  has_many :spells, through: :spell_slot

  def display
    puts "Class: #{self.class_name}"
    puts "Description: #{self.description}"
    puts "Spellcasting: #{spellcasting}"
    puts "-----------------------------"
  end
end
