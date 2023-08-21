# frozen_string_literal: true

# this class goes logic
class Action
  def self.calc(x_val)
    -Math.sqrt(Math.cos(5.0 * x_val / (1 - 6.0 * x_val))) / (x_val * x_val)
  end
end
