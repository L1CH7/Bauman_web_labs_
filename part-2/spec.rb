# frozen_string_literal: true

require_relative 'main'

RSpec.describe Action do
  let(:result) { 4 }
  let(:pairs) do
    [['3.10', -11],
     ['4.10', -12],
     ['5.10', -14],
     ['6.10', 4],
     ['7.10', 5],
     ['8.10', -10],
     ['9.10', -11]]
  end
  it 'should print the number of days with a temperature less then -10*C' do
    expect(described_class.calc10(pairs)).to eq(result)
  end
end
