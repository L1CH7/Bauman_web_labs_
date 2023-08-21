# frozen_string_literal: true

require_relative 'main'

RSpec.describe Plank do
  let(:wdt) { 50 }
  let(:hgt) { 100 }
  let(:area) { 5000 }
  it 'should calculate area of a Plank' do
    expect(wdt * hgt).to eq(area)
  end
end

RSpec.describe Plank3D do
  let(:wdt) { 10 }
  let(:hgt) { 20 }
  let(:thk) { 2 }
  let(:vol) { 400 }
  it 'should contain Plank class in ancestors' do
    expect(described_class.ancestors.include?(Plank)).to eq(true)
  end
  it 'should calculate volume of a Plank' do
    expect(wdt * hgt * thk).to eq(vol)
  end
end

# methods Class#superclass Class#subclass and Class1 < Class2
