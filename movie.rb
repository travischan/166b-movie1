class Movie
  attr_accessor :id , :count_rate
  @count_rate = 0
  def initialize(movie_id)
    @id = movie_id
  end
  def be_rated
    @count_rate = @count_rate + 1
  end
end
