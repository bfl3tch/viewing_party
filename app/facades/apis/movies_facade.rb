module APIS
  class MoviesFacade

    def self.top_40_movies_array
      first = MoviesService.top_20_rated
      second = MoviesService.next_20_rated

      both = (first[:results] + second[:results])

      both.map do |movie|
        TopFortyMovies.new(movie)
      end
    end

    def self.find_by_title(title)
      hash = MoviesService.search_by_title(title)
      hash[:results].map do |movie|
        FoundMovie.new(movie)
      end
    end

    def self.find_by_id(id)
      movie = MoviesService.movie_by_id(id)
      FoundMovie.new(movie)
    end
  end
end
