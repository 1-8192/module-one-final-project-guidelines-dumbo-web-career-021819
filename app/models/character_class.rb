# The model for the character class class data.
class CharacterClass < ActiveRecord::Base
  has_many :spells, through: :spell_slots

  #Displays instance info in a nicer format
  def display
    puts
    puts "* Class: #{self.class_name} *"
    puts
    puts "Description: #{self.description}"
    puts
    puts "Spellcasting: #{spellcasting}"
    puts
    puts "-----------------------------"
  end

  def self.display_specific_character_class(choice)
    CharacterClass.all.map do |character_class|
      if choice == character_class.class_name
        character_class.display
      end
    end
  end

end
