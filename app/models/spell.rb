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

 def self.group_by_level(level)
   group_array = []
   self.all.map do |ind_spell|
     if ind_spell.level == level
       group_array << ind_spell
     end
   end
   group_array
 end

 def self.group_by_school(school)
   group_array = []
   self.all.map do |ind_spell|
     if ind_spell.school == school
       group_array << ind_spell
     end
   end
   group_array
end

def self.group_by_class(input_class)
  group_array = []
  self.all.map do |ind_spell|
    class_array = ind_spell.classes.split(",")
    class_array.map do |character_class|
      if character_class == input_class
        group_array << ind_spell
      end
    end
  end
  group_array
end

end
