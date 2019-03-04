require 'rest-client'
require 'json'
require 'pry'

def seed_classes
  # make the web request
  response_string = RestClient.get('http://dnd5eapi.co/api/classes/')
  response_hash = JSON.parse(response_string)
  response_hash["count"].to_i.times do
    response_hash["results"].each do |class_hash|
      class_info = RestClient.get(class_hash["url"])
      class_info = JSON.parse(class_info)
      binding.pry
    end
  end
end
