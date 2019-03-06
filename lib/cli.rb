require 'tty-prompt'
require 'pry'

# prints welcome image
def welcome_image
puts
puts "                                 ______________"
puts "           ,===:'.,            `-._            "
puts "                `:.`---.__         `-._        "
puts "                  `:.     `--.         `.      "
puts "                    \\.        `.         `.    "
puts "            (,,(,    \\.         `.   ____,-`., "
puts "         (,'     `/   \\.   ,--.___`.'          "
puts "     ,  ,'  ,--.  `,   \\.;'         `          "
puts "      `{, {    \\  :    \\;                      "
puts "        ,,'    /  /    //                      "
puts "        j;;    /  ,' ,-//.    ,---.      ,     "
puts "        \;'   /  ,' /  _  \  /  _  \   ,'/     "
puts "              \   `'  / \  `'  / \  `.' /      "
puts "               `.___,'   `.__,'   `.__,'  img_source = John VanderZwaag"
puts
end

# weclomes user with nice words
def welcome
  puts
  puts "-------------------------------------------------------------------"
  p "Welcome, adventurer, to the D&D spell builder! This is a resource where you can browse spells and save them to personalized spell slots to help build your character. All information provided is based on the 5th edition of the game and comes straight from the API. You can trust us!"
  puts
end

# initial prompt asks user to search class info, spells, or build spell slots
def first_options_prompt
  prompt = TTY::Prompt.new
  prompt.select("Are you interested in class information, spell information, or do you want to view/build spell slots for your character:", %w(Class Spells Slots Exit))
end

#class info initial prompt
def class_prompt
  prompt = TTY::Prompt.new
  prompt.select("Welcome to the class information section. Would you like to see information for all classes or a specific one?", %w(All Specific Back))
end

#brings up info on a specific class
def specific_class_prompt
  prompt = TTY::Prompt.new
  choice = prompt.select("Please select a class you'd like to know more about", %w(Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue Sorcerer Warlock Wizard))
  CharacterClass.display_specific_character_class(choice)
end

#initial spell search prompt
def spells_prompt
  prompt = TTY::Prompt.new
  prompt.select("There are over 300 spells in D&D 5e, would you like to view them all, or refine your search by class, spell level, or school of magic?", %w(All Class Level School Back))
end

#refines search by spell level
def spells_level_prompt
  puts "Please enter the desired spell level (0-9)"
  input = gets.chomp.to_i
  while input < 0 || input > 9
    puts "Invalid level! Try again!"
    input = gets.chomp.to_i
  end
    Spell.all.group_by_level(input).map do |spell|
      spell.display
    end
  end

#asks user to refine search by school of magic
def spells_school_prompt
  prompt = TTY::Prompt.new
  school_prompt = prompt.select("There are 8 schools of magic in 5th edition. To view associated spells, please pick from the following list:", %w(Abjuration Conjuration Divination Enchantment Evocation Illusion Necromancy Transmutation))
  Spell.all.group_by_school(school_prompt).map do |spell|
    spell.display
  end
end

#asks user to refine spell search by class
def spells_class_prompt
  prompt = TTY::Prompt.new
  class_prompt = prompt.select("Pick a class to view the associated spells:", %w(Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue Sorcerer Warlock Wizard))
  Spell.all.group_by_class(class_prompt).map do |spell|
    spell.display
  end
end

#asks user to pick a clas to build slots for
def slots_class_prompt
  prompt = TTY::Prompt.new
  slots_class_prompt = prompt.select("Which caster class are you building spell slots for?", %w(Bard Cleric Druid Paladin Ranger Sorcerer Warlock Wizard))
end

#asks user to refine search by spell level
def slots_level_prompt(specific_class)
  puts "Which level of spell are you interested in? (0-9)"
  spell_level = gets.chomp.to_i
  while spell_level < 0 || spell_level > 9
    puts "Invalid level! Try again!"
    spell_level = gets.chomp.to_i
  end
    Spell.all.group_by_class_and_level(specific_class, spell_level).map do |spell|
      spell.display
    end
  end
#asks whether use wants to save spell slot
def save_or_view_or_back?
  prompt = TTY::Prompt.new
  prompt.select("Would you like to save a spell, view your current spell slots, or exit this menu?", %w(Save View Back))
end
#confirms name of spell to be saved to slot
def ask_spell_name
  p "Please input the name of the desired spell."
  input = gets.chomp
  input
end

#checks to make sure spell slot doesn't exist and adds it.
def create_spell_slot(input_spell_name, input_character_class)
  SpellSlot.find_or_create_by(spell_id: Spell.find_by(name: input_spell_name).id, character_class_id: CharacterClass.find_by(class_name: input_character_class).id)
end

#displays spell slots for current class
def display_spell_slots(character_class)
  class_slots = SpellSlot.group_by_class(character_class)
  if class_slots == []
    puts "Your #{character_class} does not know any spells yet."
  else
    puts "Your #{character_class} knows the folowing spells:"
  count = 1
  class_slots.map do |x|
    x.display(count)
    count +=1
  end
end
end

#exit image and message
def exit_image
puts "                         "
puts"                       ______                 "
puts"                     .-      -.             "
puts"                   /           \\           "
puts"                  |            |         "
puts"                  |, .-.  .-. ,|         "
puts"                  | )(__/\\__)( |         "
puts"                  |/    /\\    \\|         "
puts"       (@_       (_     ^^     _)                                 "
puts"       ) \\_______ \\__|IIIIII|__/__________________________   "
puts" (_)@8@8{}<________|-\\IIIIII/-|___________________________ > "
puts"        )_/        \\          /                                    "
puts"        (@          `--------` img_source = jgs                   "
end

def exit_message
  puts
  puts "*************************"
  puts "Godspeed, dungeon delver!"
  puts "*************************"
  puts
  exit
end
