# frozen_string_literal: true

require_relative 'main'

RSpec.describe Action do
  let(:result) { 'Ali t eleme of a array lite if the sp more than one li' }
  let(:text) { 'Align the elements of an array literal if they span more than one line'.split(' ') }
  let(:num) { [3, 1, 5, 4, 1, 6, 4, 2, 3, 2, 9, 5, 3, 2] }
  it 'should truncate string words by length' do
    expect(described_class.execute(text, num)).to eq(result.split(' '))
  end
end
