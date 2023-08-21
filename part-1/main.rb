# frozen_string_literal: true

# this class does logic
class Action
  def self.calc(acc = 1e-4)
    result = 0
    n = 1
    x = 2
    loop do
      term = (n.odd? ? 1 : -1) * Math.sin(n * x) / n
      break if term.abs < acc.to_f

      result += term
      n += 1
    end
    result
  end
end
