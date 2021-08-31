class MovieReview
  attr_reader :author, :content

  def initialize(review)
    @author = review[:author]
    @content = review[:content]
  end

end
