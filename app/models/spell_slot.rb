# Spell slots are the join model for class and spell
class SpellSlot < ActiveRecord::Base
  belongs_to :character_class
  belongs_to :spell

  def display(count)
    puts "-----------------------------------------------"
    puts "Spell slot: #{count}"
    puts "Character Class: #{self.character_class.class_name}"
    puts "Spell: #{self.spell.name}"
    puts "Description: #{self.spell.description}"
    puts "------------------------------------------------"
  end

  def self.delete_slot(spell_name)
    bool = 0
    self.all.map do |ind_spell_slot|
    if ind_spell_slot.spell.name == spell_name
      ind_spell_slot.delete
      bool = 1
    end
  end
    if bool == 0
      puts "Not a valid spell for deletion."
    end
  end

  def self.group_by_class(input_class)
    self.all.select do |ind_spell_slot|
      ind_spell_slot.character_class.class_name == input_class
    end
  end

end
