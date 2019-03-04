require_relative '../config/environment'
require_relative '..lib/api_communicator'

puts get_character_movies_from_api("Barbarian")
