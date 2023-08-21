# frozen_string_literal: true

require_relative 'main'

(-5..5).each { |x| p Action.calc(x) }
