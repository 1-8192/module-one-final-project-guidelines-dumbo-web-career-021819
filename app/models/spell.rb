# the model for spells

class Spell < ActiveRecord::Base
  has_many :character_classes, through: :spell_slots

#displays instance info in a nicer format.
 def display
   puts
   puts "Spell name: #{self.name}"
   puts "Description: #{self.description}"
   puts "Level: #{self.level}"
   puts "School of Magic: #{self.school}"
   puts "Compatible Classes: #{self.classes}"
   puts "-----------------------------------"
 end

 #selects all instances of a specific level
 def self.group_by_level(level)
   group_array = []
   self.all.map do |ind_spell|
     if ind_spell.level == level
       group_array << ind_spell
     end
   end
   group_array
 end

#selects all instances of a specific school
 def self.group_by_school(school)
   group_array = []
   self.all.map do |ind_spell|
     if ind_spell.school == school
       group_array << ind_spell
     end
   end
   group_array
end

#selects all instances of a specific class
def self.group_by_class(input_class)
  self.all.select do |ind_spell|
    ind_spell.classes.include?(input_class)
  end
end

#selects all instances by class and spell level
def self.group_by_class_and_level(input_class, input_level)
  output_array = []
  self.all.map do |ind_spell|
    if ind_spell.level == input_level && ind_spell.classes.include?(input_class)
      output_array << ind_spell
  end
end
output_array
end

end
