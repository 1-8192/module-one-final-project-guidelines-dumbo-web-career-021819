require 'rest-client'
require 'json'
require 'pry'
Spell.destroy_all
# def seed_classes
#   # make the web request
#   response_string = RestClient.get('http://dnd5eapi.co/api/classes/')
#   response_hash = JSON.parse(response_string)
#   response_hash["count"].to_i.times do
#     response_hash["results"].each do |class_hash|
#       class_info = RestClient.get(class_hash["url"])
#       class_info = JSON.parse(class_info)
#       instance_class = CharacterClass.new(:class_name = class_info["name"])
#
#     end
#   end
# end

# def seed_spells
  response_string = RestClient.get('http://dnd5eapi.co/api/spells/')
  response_hash = JSON.parse(response_string)
    response_hash["results"].each do |spell_hash|
      spell_info = RestClient.get(spell_hash["url"])
      spell_info = JSON.parse(spell_info)
      instance_spell = Spell.create
      instance_spell.name = spell_info["name"]
      instance_spell.description = spell_info["desc"]
      instance_spell.level = spell_info["level"]
      instance_spell.school = spell_info["school"]["name"]
      class_array = []
      spell_info["classes"].each do |x|
        class_array << x["name"]
      end
      instance_spell.classes = class_array.join(", ")
    end
