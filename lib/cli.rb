require 'tty-prompt'
require 'pry'


def welcome
  p "Welcome, adventurer, to the D&D spell builder! This is a resource where you can browse spells and save them to personalized spell slots to help build your character. All information provided is based on the 5th edition of the game and comes straight from the API. You can trust us!"
end

def first_options_prompt
  prompt = TTY::Prompt.new
  prompt.select("Are you interested in class information, spell information, or do you want to view your current spell slots:", %w(Class Spells Slots))
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
