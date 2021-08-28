module APIS
  class Movies

    def self.top_movies_collected_as_json
      first = API.top_20_rated
      second = API.next_20_rated

      both = first.merge(second)
    end

    def get_movie_names
      # require "pry"; binding.pry
      top_movies_collected_as_json
    end
  end
end
