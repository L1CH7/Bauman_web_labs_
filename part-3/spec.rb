# frozen_string_literal: true

require_relative 'main'

RSpec.describe Logic do
  let(:result) { { min: -2, max: 2 } }
  let(:func_l) { ->(x) { 2 - (x - 4).abs } }
  let(:limits) { { first: 0, second: 6 } }
  let(:acc) { 0.01 }
  it 'should return max and min values of lambda function at limits' do
    expect(Logic.minmax_lambda(limits[:first], limits[:second], acc, func_l)).to eq(result)
  end
  it 'should return min and max values of yield function at limits' do
    expect(Logic.minmax_yield(limits[:first], limits[:second], acc) { |x| 2 - (x - 4).abs }).to eq(result)
  end
end
