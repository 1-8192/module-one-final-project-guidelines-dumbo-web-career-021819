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

end
