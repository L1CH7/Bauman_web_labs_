# frozen_string_literal: true

require_relative 'main'

RSpec.describe Action do
  # let(:input1) { '(0..rand(1..10)).map { ('a'..'z').to_a[rand(1..26)] }.join' }
  let(:input2) {  (0..rand(1..10)).map { 'eErtU'.chars[rand(4)] }.join }
  let(:file_name) { 'F_spec.dat' }
  # let(:file_spec) { File.open file_name, 'w' }
  it 'Both files should exist and string should be written to file' do
    expect(described_class.open(file_name, input2)).to eq(true) # true if both F and G exists
  end

  described_class.process
  it 'File G should be empty' do
    data_g = File.readlines('G.dat').join
    expect(data_g).to eq ''
  end
end
