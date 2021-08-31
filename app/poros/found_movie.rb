class FoundMovie
  attr_reader :title, :id, :vote_average, :runtime, :overview, :genres, :image

  def initialize(movie)
    @title = movie[:title]
    @id = movie[:id]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @overview = movie[:overview]
    @genres = movie[:genres]
    @image = "https://image.tmdb.org/t/p/original#{movie[:poster_path]}"
  end
end
