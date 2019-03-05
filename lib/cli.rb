require 'tty-prompt'
require 'pry'


def welcome
  p "Welcome, adventurer, to the D&D spell builder! This is a resource where you can browse spells and save them to personalized spell slots to help build your character. All information provided is based on the 5th edition of the game and comes straight from the API. You can trust us!"
end

def first_options_prompt
  prompt = TTY::Prompt.new
  prompt.select("Are you interested in class information, spell information, or do you want to view/build spell slots for your character:", %w(Class Spells Slots))
end

def class_prompt
  prompt = TTY::Prompt.new
  prompt.select("Welcome to the class information section. Would you like to see information for all classes or a specific one?", %w(All Specific))
end

def specific_class_prompt
  prompt = TTY::Prompt.new
  choice = prompt.select("Please select a class you'd like to know more about", %w(Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue Sorcerer Warlock Wizard))
  CharacterClass.all.map do |character_class|
    if choice == character_class.class_name
      character_class.display
    end
  end
end

def spells_prompt
  prompt = TTY::Prompt.new
  prompt.select("There are over 300 spells in D&D 5e, would you like to view them all, or refine your search by class, spell level, or school of magic?", %w(All Class Level School))
end

def spells_level_prompt
  puts "Please enter the desired spell level (0-9)"
  input = gets.chomp.to_i
  if input < 0 || input > 9
    puts "Invalid spell level."
  else
    Spell.all.display_by_level(input)
  end
end

def spells_school_prompt
  prompt = TTY::Prompt.new
  school_prompt = prompt.select("There are 8 schools of magic in 5th edition. To view associated spells, please pick from the following list:", %w(Abjuration Conjuration Divination Enchantment Evocation Illusion Necromancy Transmutation))
  Spell.all.display_by_school(school_prompt)
end
