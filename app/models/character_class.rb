class CharacterClass < ActiveRecord::Base
  has_many :spells, through: :spell_class
end
