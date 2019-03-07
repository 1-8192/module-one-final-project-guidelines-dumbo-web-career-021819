require 'rest-client'
require 'json'
require 'pry'
Spell.destroy_all
CharacterClass.destroy_all
SpellSlot.destroy_all

# # Seeds the class info
#   response_string = RestClient.get('http://dnd5eapi.co/api/classes/')
#   response_hash = JSON.parse(response_string)
#     response_hash["results"].each do |class_hash|
#       class_info = RestClient.get(class_hash["url"])
#       class_info = JSON.parse(class_info)
#       instance_class = CharacterClass.new
#       instance_class.class_name = class_info["name"]
#       if class_info.key?("spellcasting")
#         spellcasting_string = RestClient.get(class_info["spellcasting"]["url"])
#         spellcasting_hash = JSON.parse(spellcasting_string)
#         spellcasting_desc_array = []
#         spellcasting_hash["info"].each do |element|
#           if element.key?("desc")
#             spellcasting_desc_array << element["desc"]
#           end
#         end
#         instance_class.spellcasting = spellcasting_desc_array.join(" ")
#       else
#         instance_class.spellcasting = "none"
#       end
#       subclass_string = RestClient.get(class_info["subclasses"][0]["url"])
#       subclass_hash = JSON.parse(subclass_string)
#       instance_class.description = subclass_hash["desc"][0]
#       instance_class.save
#     end
#
#
# # Seeds the spell list
#   response_string = RestClient.get('http://dnd5eapi.co/api/spells/')
#   response_hash = JSON.parse(response_string)
#     response_hash["results"].each do |spell_hash|
#       spell_info = RestClient.get(spell_hash["url"])
#       spell_info = JSON.parse(spell_info)
#       instance_spell = Spell.new
#       instance_spell.name = spell_info["name"]
#       instance_spell.description = spell_info["desc"][0]
#       instance_spell.level = spell_info["level"]
#       instance_spell.school = spell_info["school"]["name"]
#       class_array = []
#       spell_info["classes"].each do |x|
#         class_array << x["name"]
#       end
#       instance_spell.classes = class_array.join(", ")
#       instance_spell.save
#     end


# Made up test data for seeds
wizard = CharacterClass.create(class_name: "Wizard", description: "Magical scholar", spellcasting: "Can cast wizard spells")
sorcerer = CharacterClass.create(class_name: "Sorcerer", description: "Naturally magical", spellcasting: "Can cast sorcerer spells")
cleric = CharacterClass.create(class_name: "Cleric", description: "Healer", spellcasting: "Can heal people")

fire_blast = Spell.create(name: "Fire Blast", description: "Huge blast of fire", level: 1, school: "Evocation", classes: "Wizard, Sorcerer")
ice_blast = Spell.create(name: "Ice Blast", description: "Huge blast of ice", level: 1, school: "Evocation", classes: "Sorcerer")
cure_wounds = Spell.create(name: "Cure Wounds", description: "Heals wounds", level: 3, school: "Necromancy", classes: "Cleric")
