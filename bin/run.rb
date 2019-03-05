require_relative '../config/environment.rb'
require_relative '../db/seeds.rb'
require_all 'lib'
require_all 'app'

prompt = TTY::Prompt.new
welcome
first_prompt = first_options_prompt
  if first_prompt == "Class"
    if class_prompt == "All"
      CharacterClass.all.map do |character_class|
        character_class.display
      end
    else
      specific_class_prompt
    end
  elsif first_prompt == "Spells"
    first_spell_prompt = spells_prompt
    if first_spell_prompt == "All"
      Spell.all.map do |ind_spell|
        ind_spell.display
      end
    elsif first_spell_prompt == "Level"
      spells_level_prompt
    elsif first_spell_prompt == "School"
      spells_school_prompt 
    end
  end
