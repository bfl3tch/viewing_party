class MoviesController < ApplicationController

  def index
    if params[:query].present?
      @search = APIS::MoviesFacade.find_by_title(params[:query])
    else params[:query].nil?
      @movies = APIS::MoviesFacade.top_40_movies_array
    end
  end

  def show
    @movie = APIS::MoviesFacade.find_by_id(params[:id])
    @movie_credits = APIS::MoviesFacade.get_movie_credits(params[:id])
    @movie_reviews = APIS::MoviesFacade.get_movie_reviews(params[:id])

    @genres = @movie.genres.map { |genre| genre[:name] }

    session[:movie_id] = { movie_id: @movie.id, runtime: @movie.runtime, title: @movie.title }
  end
end
