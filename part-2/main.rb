# frozen_string_literal: true

# this class does logic
class Action
  def self.calc_t(acc = 1e-4)
    x = 2
    (1..).inject(0) do |result, n|
      term = (n.odd? ? 1 : -1) * Math.sin(n * x) / n
      return result if term.abs < acc.to_f

      result + term
    end
  end
end
