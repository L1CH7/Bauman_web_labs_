# frozen_string_literal: true

# this class does logic
class Action
  def self.execute(words_a, numbers_a)
    return nil if words_a.length != numbers_a.length

    words_a.zip(numbers_a).map { |word, number| word.length > number ? word[0, number] : word }
  end
end
