class Spell < ActiveRecord::Base
  has_many :character_classes, through: :spell_slot

 def display
   puts "Spell name: #{self.name}"
   puts "Description: #{self.description}"
   puts "Level: #{self.level}"
   puts "School of Magic: #{self.school}"
   puts "Compatible Classes: #{self.classes}"
   puts "-----------------------------------"
 end

 def self.display_by_level(level)
   self.all.map do |ind_spell|
     if ind_spell.level == level
       ind_spell.display
     end
   end
 end

 def self.display_by_school(school)
   self.all.map do |ind_spell|
     if ind_spell.school == school
       ind_spell.display
     end
   end
end 

end
