class User
  attr_accessor :user_id, :rate_moives
  @rate_moives = []
  def initialize(user_id)
    @id = user_id
  end

  def rate(movie_id)
    rate_moives << movie_id
  end
end