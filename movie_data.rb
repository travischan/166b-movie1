
require_relative 'movie'
require_relative 'user'
class MovieData
  @@hash_user = Hash.new
  @@hash_movie = Hash.new
  @@count_rate = 0
  def initialize(filename)
    aFile = File.new(filename, "r")
    aFile.each do |line|
      arr = line.split
      if @@hash_user.has_key?(arr[0].to_i)
        @@hash_user[arr[0].to_i] << arr[1].to_i
      else
        arr_tmp = []
        arr_tmp << arr[1].to_i
        @@hash_user.store(arr[0].to_i, arr_tmp)
      end

      if @@hash_movie.has_key?(arr[1].to_i)
        @@hash_movie[arr[1].to_i] = (@@hash_movie[arr[1].to_i] + 1)
      else
        tmp = 1
        @@hash_movie.store(arr[1].to_i, 1)
      end
      @@count_rate = @@count_rate + 1
    end
    aFile.close

  end

  def popularity(movie_id)
    pop =  @@hash_movie[movie_id]/@@count_rate.to_f*5
    #puts "popularity is #{pop}"
    return pop
  end

  def popularity_list()
    arr = @@hash_movie.sort { |a, b|  b[1]<=>a[1]}
    result = []
    arr.each do |num|
      result << num[0]
    end
    return result
  end

  def similarity(user1, user2)
    if user1 == user2
      puts "similarity is 1"
      return 1
    end
    arr1 = @@hash_user[user1]
    arr2 = @@hash_user[user2]
    all = [@@hash_user[user1].length, @@hash_user[user2].length].max
    simi = (arr1 & arr2).length/all.to_f
    #puts "similarity is #{simi}"
    return simi
  end

  def most_similar(u)
    hash = Hash.new

    @@hash_user.each do |key, value|
      if key == u
        next
      else
        new = similarity u, key
        hash.store key, new
      end
    end
    arr = hash.sort { |a, b|  b[1]<=>a[1]}
    result = []
    arr.each do |num|
      result << num[0]
    end
    return result
  end
end