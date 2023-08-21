# frozen_string_literal: true

require_relative 'main'

loop do
  print 'Enter accuracy (for example: 1e-3), % - end: '
  input = gets.chomp
  if input == '%' || input.to_f.zero?
    puts 'stopped!'
    break
  end
  puts "result = #{Action.calc(input.to_f)}"
end
