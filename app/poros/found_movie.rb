class FoundMovie
  attr_reader :title, :id, :vote_average, :runtime, :overview, :genres

  def initialize(movie)
    @title = movie[:title]
    @id = movie[:id]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @overview = movie[:overview]
    @genres = movie[:genres]
  end
end
