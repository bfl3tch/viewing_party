class TopFortyMovies
  attr_reader :title, :id, :vote_average, :image

  def initialize(movie)
    @title = movie[:title]
    @id = movie[:id]
    @vote_average = movie[:vote_average]
    @image = "https://image.tmdb.org/t/p/original#{movie[:poster_path]}"
  end
end
