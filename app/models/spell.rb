class Spell < ActiveRecord::Base
  has_many :character_classes, through: :spell_class

  # def self.assign_classes_to_spells
  #   self.all.each do |spell|
  #     spell.classes.map do |character_class|
  #       id = CharacterClass.all.map do |ind|
  #             if ind.name == character_class
  #               ind.id
  #             end
  #           end
  #       SpellClass.new = (self.id, id)
  # end
end
