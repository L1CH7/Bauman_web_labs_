# frozen_string_literal: true

require_relative 'main'

RSpec.describe Action do
  let(:result) { 1.0021934168699378 }
  let(:acc) { 1e-5 }
  it '' do
    expect(described_class.calc(acc)).to eq(result)
  end
end
