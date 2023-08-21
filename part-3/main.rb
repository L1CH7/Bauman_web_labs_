# frozen_string_literal: true

# this class does logic
class Logic
  def self.minmax_lambda(a, b, accuracy, mylambda)
    return nil if a > b

    min = max = mylambda.call(a)
    (a..b).step(accuracy) do |x|
      y = mylambda.call(x)
      min = y if y < min
      max = y if y > max
    end
    { min: min, max: max }
  end

  def self.minmax_yield(a, b, accuracy)
    return nil if a > b

    min = max = yield(a)
    (a..b).step(accuracy) do |x|
      y = yield(x)
      min = y if y < min
      max = y if y > max
    end
    { min: min, max: max }
  end
end
