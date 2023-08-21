# frozen_string_literal: true

require_relative 'main'

plank_flat = Plank.new(12, 13)
plank_bulky = Plank3D.new(10, 5, 6)

puts "Flat plank: width: #{plank_flat.width}, height: #{plank_flat.height}, area: #{plank_flat.area}"
puts "Bulky plank: width: #{plank_bulky.width}, height: #{
    plank_bulky.height}, thickness: #{plank_bulky.thickness}, volume: #{plank_bulky.volume}"
