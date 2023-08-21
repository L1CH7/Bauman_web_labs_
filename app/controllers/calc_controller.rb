# frozen_string_literal: true

# class CalcController
class CalcController < ApplicationController
  include CalcHelper
  before_action :authenticate_user!
  def nod(x, y)
    return x + y if (x * y).zero?

    x > y ? nod(x % y, y) : nod(x, y % x)
  end

  def nok(x, y)
    x * y != 0 ? x * y / nod(x, y) : 0
  end

  def authenticate_user!
    if user_signed_in?
      puts "User #{current_user} is authenticated"
    else
      puts "User isn't authenticated"
      redirect_to new_user_session_path
    end
  end

  def input; end

  def view
    @number_a = params[:number_a].to_i
    @number_b = params[:number_b].to_i
    @nod = nod(@number_a, @number_b)
    @nok = nok(@number_a, @number_b)
    @result = { nod: @nod, nok: @nok }
  end
end
