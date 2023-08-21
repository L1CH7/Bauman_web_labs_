# frozen_string_literal: true

# a controller for logic
class LogicController < ApplicationController
  before_action :correction_check, only: :view
  before_action :define_output, only: :view

  def input; end

  def view
    respond_to do |format|
      format.html
      format.xml { render xml: { array: @result } }
    end
  end

  def nod(x, y)
    return x + y if (x * y).zero?

    x > y ? nod(x % y, y) : nod(x, y % x)
  end

  def nok(x, y)
    x * y != 0 ? x * y / nod(x, y) : 0
  end

  def correction_check
    a_st = params[:number_a]
    b_st = params[:number_b]
    @num_a = a_st.to_i
    @num_b = b_st.to_i
    if @num_a.to_s != a_st || @num_b.to_s != b_st
      error_notice = 'Некорректный ввод! Можно вводить только целые числа без использования иных символов.'
    end
    error_notice = 'Некорректный ввод! Введите целые числа, большие нуля.' if @num_a <= 0 || @num_b <= 0
    redirect_to(root_path, notice: error_notice) unless error_notice.nil?
  end

  def define_output
    @nod = nod(@num_a, @num_b)
    @nok = nok(@num_a, @num_b)
    @result = { nod: @nod, nok: @nok }
  end
end
