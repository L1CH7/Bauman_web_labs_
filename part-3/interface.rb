# frozen_string_literal: true

require_relative 'main'

p Logic.minmax_lambda(0, 2, 0.01, ->(x) { (x - 1) / (x + 2) })
p Logic.minmax_yield(-1, 1, 0.01) { |x| Math.sin(x / 2 - 1) }
