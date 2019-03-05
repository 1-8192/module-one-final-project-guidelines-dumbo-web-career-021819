require 'tty-prompt'
require 'pry'


def welcome
  p "Welcome adventurer to the D&D spell builder! This is a resource where you can browse spells and save them to personalized spell slots to help build your character. All the information provided is based on 5th edition and comes straight from the API. You can trust us!"
end

def first_options_prompt
  prompt = TTY::Prompt.new
  prompt.select("Are you interested in Class Information, spell information, or do you want to view your current spell slots:", %w(class spells slots))
end

def class_prompt
  prompt = TTY::Prompt.new
  prompt.select("Welcome to the class information section. Would you like to see information for all classes, or a specific one?", %w(All Specific))
end 
