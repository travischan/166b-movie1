#!/usr/bin/ruby

class Location
  attr_accessor :longitude
  attr_accessor :latitude
  def initialize(lo,la)
    @longitude, @latitude = lo,la
  end
end

class OBD
  attr_accessor :gps
  attr_accessor :loc
  def initialize(g,l)
    @gps = g
    @loc = l
  end

end

loc = Location.new(10,20)
obd = OBD.new(1,loc)
loc2 = Location.new(20,30)
obd2 = OBD.new(5,loc2)
loc3 = Location.new(40,50)
obd3 = OBD.new(2,loc3)

@obds = []
@obds[0] = obd
@obds[1] = obd2
@obds[2] = obd3


@obds.sort! {|a,b| a.gps <=> b.gps}#注意此处的'!',如果没有'!',则原数组不会被改变,建议去掉叹号后试试效果
puts obd.gps
puts obd.loc.longitude
puts obd.loc.latitude
puts "#{@obds[0].gps},#{@obds[0].loc.longitude},#{@obds[0].loc.latitude}"
puts "#{@obds[1].gps},#{@obds[1].loc.longitude},#{@obds[1].loc.latitude}"
puts "#{@obds[2].gps},#{@obds[2].loc.longitude},#{@obds[2].loc.latitude}"