# frozen_string_literal: true

# Logic model class
class Logic < ApplicationRecord
  before_create :define_output # , :correction_check

  validates :num_a, :num_b, presence: true
  validates_uniqueness_of :num_a, scope: :num_b

  def define_output
    @nod = nod(num_a, num_b)
    @nok = nok(num_a, num_b)
    @arr = iterations(num_a, num_b)
    @result = { nod: @nod, nok: @nok }
    self.result = @result
    # params[:result] = @result
  end

  def correction_check
    a_st = num_a
    b_st = num_b
    @num_a = a_st.to_i
    @num_b = b_st.to_i
    self.num_a = @num_a
    self.num_b = @num_b
    if @num_a.to_s != a_st || @num_b.to_s != b_st
      error_notice = 'Некорректный ввод! Можно вводить только целые числа без использования иных символов.'
    end
    error_notice = 'Некорректный ввод! Введите целые числа, большие нуля.' if @num_a <= 0 || @num_b <= 0
    redirect_to(root_path, notice: error_notice) unless error_notice.nil?
  end

  private

  def nod(x, y)
    return x + y if (x * y).zero?

    x > y ? nod(x % y, y) : nod(x, y % x)
  end

  def nok(x, y)
    x * y != 0 ? x * y / nod(x, y) : 0
  end

  def iterations(a, b)
    res = []
    unless a == b || (a * b).zero?
      i = 1
      loop do
        res.append [i, a, b]
        break if (a * b).zero?

        a > b ? a %= b : b %= a
        i += 1
      end
    end
    res
  end
end
