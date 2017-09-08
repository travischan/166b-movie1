hash = Hash.new
arr = [4,67,8,9]
arr2 = [4,34,9,6]
hash.store("32423",arr)
hash.store("33",arr2)
puts ((hash.fetch "32423") & (hash.fetch "33")).class

