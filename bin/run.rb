require_relative '../config/environment.rb'
require_relative '../db/seeds.rb'
require_all 'lib'
require_all 'app'

prompt = TTY::Prompt.new
welcome
if first_options_prompt == "Class"
  if class_prompt == "All"
    CharacterClass.all.map do |character_class|
      character_class.display
    end
  else
    specific_class_prompt
  end
end
