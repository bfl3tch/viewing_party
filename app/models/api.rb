require 'faraday'
require 'json'

class API
  def initialize
  end

  def self.connection_setup
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers['Authorization'] = ENV['movie_api_key']
      faraday.headers['Content-Type'] = 'application/json;charset=utf-8'
      faraday.params['api_key'] = ENV['movie_api_key']
      # require "pry"; binding.pry
    end
  end

  def self.top_20_rated
    # require "pry"; binding.pry
    response = API.connection_setup.get("/3/movie/top_rated?&language=en-US&page=1")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.next_20_rated
    # require "pry"; binding.pry
    response = API.connection_setup.get("/3/movie/top_rated?&language=en-US&page=2")
    data = JSON.parse(response.body, symbolize_names: true)
  end
# "Dilwale Dulhania Le Jayenge"

  # def self.top_twenty_movies
  #   APIS::Movies.new(json_the_request(top_40_movies[:first_twenty])).top_movies
  # end
  #
  # def self.next_twenty_movies
  #   APIS::Movies.new(json_the_request(top_40_movies[:second_twenty])).top_movies
  # end
end
