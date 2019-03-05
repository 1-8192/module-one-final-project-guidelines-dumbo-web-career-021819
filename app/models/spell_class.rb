class SpellSlot < ActiveRecord::Base
  belongs_to :character_classes
  belongs_to :spell
end
