require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://dnd5eapi.co/api/classes/')
  response_hash = JSON.parse(response_string)

  p response_hash

  # film_urls = response_hash["results"][0]["films"]
  # turn_movie_hash_into_array(film_urls)
  # end
  #
  # def turn_movie_hash_into_array(movie_hash)
  #   film_array = []
  #   movie_hash.map do |url|
  #     response_string = RestClient.get(url)
  #     response_hash = JSON.parse(response_string)
  #     film_array << response_hash
  #   end
  end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  film_list = []
  i = 0
  films.map do |film|
    film_list << film[i]["title"]
    i += 1
  end
  film_list.join(", ")
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
