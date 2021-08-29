class MoviesController < ApplicationController

  def index
    if params[:query].present?
      @search = API.search_by_title(params[:query])
    elsif params[:query].nil?
      @movies = APIS::Movies.top_40_movies_array
    else
      @movies = []
    end
  end

  def show
    @movie = API.movie_by_id(params[:id])
    @movie_credits = API.movie_credits(params[:id])
    @movie_reviews = API.movie_reviews(params[:id])
    @genres = @movie[:genres].map { |genre| genre[:name] }
  end
end
