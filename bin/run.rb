require_relative '../config/environment.rb'
require_relative '../db/seeds.rb'
require_all 'lib'
require_all 'app'
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

prompt = TTY::Prompt.new

welcome
first_prompt = first_options_prompt
while first_prompt != "Exit"
  if first_prompt == "Class"
    class_prompt_result = class_prompt
      while class_prompt_result != "Exit"
        if class_prompt_result == "All"
        CharacterClass.all.map do |character_class|
          character_class.display
        end
        elsif class_prompt_result == "Specific"
          specific_class_prompt
        end
        class_prompt_result = class_prompt
      end
      
  elsif first_prompt == "Spells"
    first_spell_prompt = spells_prompt
      while first_spell_prompt != "Exit"
        if first_spell_prompt == "All"
          Spell.all.map do |ind_spell|
            ind_spell.display
          end
        elsif first_spell_prompt == "Level"
          spells_level_prompt
        elsif first_spell_prompt == "School"
          spells_school_prompt
        elsif first_spell_prompt == "Class"
          spells_class_prompt
        end
        first_spell_prompt = spells_prompt
      end

  elsif first_prompt == "Slots"
    s_class_prompt = slots_class_prompt
    slots_level_prompt(s_class_prompt)
    save_or_view_prompt = save_or_view_or_exit?
    while save_or_view_prompt != "exit"
      if save_or_view_prompt == "Save"
        input_spell_name = ask_spell_name
        create_spell_slot(input_spell_name, s_class_prompt)
        save_or_view_prompt = save_or_view_or_exit?
      elsif save_or_view_prompt == "View"
          count = 1
          SpellSlot.all.each do |x|
            x.display(count)
            count +=1
          end
            save_or_view_prompt = save_or_view_or_exit?
      end
    end
    first_prompt = first_options_prompt
  end
  exit_method
  end
