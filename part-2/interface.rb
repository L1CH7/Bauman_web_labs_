# frozen_string_literal: true

require_relative 'main'

temp_arr = [-11, -12, -14, 4, 5, -10, -11]
date_arr = ['3.10', '4.10', '5.10', '6.10', '7.10', '8.10', '9.10']

date_temp_arr = Action.zip_date_temp(date_arr, temp_arr)
Action.print_date_temp(date_temp_arr)
puts "The number of days with a temperature less then -10*C : #{Action.calc10(date_temp_arr)}"
