class DiscoversController < ApplicationController

  def show
    # require "pry"; binding.pry
    @movies = APIS::Movies.top_movies_collected_as_json
  end
end
