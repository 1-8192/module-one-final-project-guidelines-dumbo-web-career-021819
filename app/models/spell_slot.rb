require 'pry'
# Spell slots are the join model for class and spell
class SpellSlot < ActiveRecord::Base
  belongs_to :character_class
  belongs_to :spell

# displays instance info in a nicer format
  def display(count)
    puts "-----------------------------------------------"
    puts "Spell slot: #{count}"
    puts "Character Class: #{self.character_class.class_name}"
    puts "Spell: #{self.spell.name}"
    puts "Description: #{self.spell.description}"
    puts "------------------------------------------------"
  end

# deletes a spell slot based on spell name if it already exists
  def self.delete_slot(spell_name)
    if !self.all.any?{|spell_slot| spell_slot.spell.name == spell_name}
      puts "Oops. Not a valid spell for deletion."
    else
      self.all.map do |ind_spell_slot|
         if ind_spell_slot.spell.name == spell_name
         ind_spell_slot.delete
         end
       end
    end
  end

  def self.group_by_class(input_class)
    self.all.select do |ind_spell_slot|
      ind_spell_slot.character_class.class_name == input_class
    end
  end

end
