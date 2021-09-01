require 'faraday'
require 'json'

class MoviesService
  def self.connection_setup
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['Authorization'] = ENV['movie_api_key']
      faraday.headers['Content-Type'] = 'application/json;charset=utf-8'
    end
  end

  def self.top_20_rated
    response = MoviesService.connection_setup.get('/3/movie/top_rated?&language=en-US&page=1')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.next_20_rated
    response = MoviesService.connection_setup.get('/3/movie/top_rated?&language=en-US&page=2')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_by_id(movie_id)
    response = MoviesService.connection_setup.get("/3/movie/#{movie_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_credits(movie_id)
    response = MoviesService.connection_setup.get("/3/movie/#{movie_id}/credits")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_reviews(movie_id)
    response = MoviesService.connection_setup.get("/3/movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_by_title(title)
    response = MoviesService.connection_setup.get("/3/search/movie?query=#{title}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
