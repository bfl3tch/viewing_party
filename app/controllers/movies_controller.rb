class MoviesController < ApplicationController

  def index
    @movies = APIS::Movies.top_40_movies_array
  end

  def show
    @movie = API.movie_by_id(params[:id])
  end
end
