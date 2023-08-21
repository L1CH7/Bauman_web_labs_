# frozen_string_literal: true

# a logics controller class
class LogicsController < ApplicationController
  def new
    @logic = Logic.new
  end

  def index
    @logics = Logic.all
  end

  def create
    if Logic.new(params[:logic].permit(:num_a, :num_b)).valid?
      @logic = Logic.new(params[:logic].permit(:num_a, :num_b))
      if @logic.save
        redirect_to logics_path
      else
        render 'new'
      end
    else
      redirect_to logics_path
    end
  end

  def destroy
    Logic.destroy(params[:id])
    redirect_to logics_path
  end

  def result
    @res = Logic.all
    render xml: @res
  end
end
