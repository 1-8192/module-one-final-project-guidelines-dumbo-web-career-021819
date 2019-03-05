class Spell < ActiveRecord::Base
  has_many :character_classes, through: :spell_slot

#displays instance info in a nicer format.
 def display
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
  input_class_array = []
  self.all.map do |ind_spell|
    class_array = ind_spell.classes.split(",")
    class_array.select do |character_class|
      if character_class == input_class
        input_class_array << character_class
      end
    end
  end
  input_class_array
end

#selects all instances by class and spell level
def self.group_by_class_and_level(input_class, input_level)
  output_array = []
  pre_output_array = []
  self.all.map do |ind_spell|
    class_array = ind_spell.classes.split(",")
    class_array.select do |character_class|
      if character_class == input_class
        pre_output_array << character_class
      end
    end
  end
  pre_output_array.map do |ind_spell|
    self.all.map do |ind_spell|
      if ind_spell.level == input_level
        output_array << ind_spell
      end
    end
    return output_array
  end
end
end
