module APIS
  class Movies

    def self.top_40_movies_array
      first = API.top_20_rated
      second = API.next_20_rated

      both = (first[:results] + second[:results])
    end
  end
end
