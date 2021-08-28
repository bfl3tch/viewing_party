require 'faraday'
require 'json'

class API
  def initialize
  end

  def self.connection_setup
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers['Authorization'] = ENV['movie_api_key']
      faraday.headers['Content-Type'] = 'application/json;charset=utf-8'
    end
  end

  def self.top_20_rated
    response = API.connection_setup.get("/3/movie/top_rated?&language=en-US&page=1")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.next_20_rated
    response = API.connection_setup.get("/3/movie/top_rated?&language=en-US&page=2")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
