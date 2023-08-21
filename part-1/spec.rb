# frozen_string_literal: true

require_relative 'main'

RSpec.describe Action do
  let(:result) { -0.09324195846522262 }
  let(:val) { -3 }
  it 'should print approximation of infinite sum' do
    expect(described_class.calc(val)).to eq(result)
  end
end
