require_relative 'movie'
arr = [43,55,6,5]
arr2 = [3,6,8,9]
@arr3 = []
@arr4 = []
arr.each do |num|

  tmp = Movie.new num
  @arr3 << tmp

end

arr2.each do |num|
  tmp = Movie.new num
  @arr4 << tmp
end
@arr3.sort! {|a,b| a.id <=> b.id}
puts @arr3.methods
