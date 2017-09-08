require_relative 'movie_data'
movie_data = MovieData.new "ml-100k/u.data"
#pop = movie_data.popularity(1090)
movie_data.popularity_list;
#movie_data.similarity(45,45)
#movie_data.most_similar 1