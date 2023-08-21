# frozen_string_literal: true

require_relative 'main'

(1..).each do
  print 'Enter accuracy (for example: 1e-3), % - end: '
  input = gets.chomp
  if input == '%' || input.to_f.zero?
    puts 'stopped!'
    break
  end
  puts "result = #{Action.calc_t(input.to_f)}"
end
