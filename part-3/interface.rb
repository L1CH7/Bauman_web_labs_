# frozen_string_literal: true

require_relative 'main'

count = rand(3..10)
puts words_string   = Array.new(count) { (0..rand(1..10)).map { ('a'..'z').to_a[rand(1..26)] }.join }.join(' ')
puts numbers_string = Array.new(count) { rand(1..10) }.join(' ')
p words = words_string.split(' ')
p numbers = numbers_string.split(' ')
                          .map(&:to_i)
puts Action.execute(words, numbers)
           .join(' ')
