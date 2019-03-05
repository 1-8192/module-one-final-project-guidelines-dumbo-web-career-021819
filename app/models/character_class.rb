class CharacterClass < ActiveRecord::Base
  has_many :spells, through: :spell_class

  def display
    puts "Class: #{self.class_name}"
    puts "Description: #{self.description}"
    puts "Spellcasting: #{self.spellcasting}"
    puts "----------------------------------"
  end

end
