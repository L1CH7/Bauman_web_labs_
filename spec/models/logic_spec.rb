# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Logic, type: :model do
  # тест на добавление и поиск данных с помощью модели
  describe 'create data' do
    subject { Logic.new(num_a: 1011, num_b: 252) }
    it 'should create new row' do
      subject.save
      expect(subject).to be_persisted # проверка что объект был сохранен
    end
  end

  describe 'search data' do
    it 'should found created row' do
      l = Logic.create(num_a: 1011, num_b: 251)
      expect(Logic.count).to eq 1
      expect(Logic.where(num_a: 1011, num_b: 251).first).to eq l
    end
  end

  # тест модели, проверяющий невозможность повторного добавления одних и тех же параметров.
  describe 'is valid?' do
    it 'should add one row; second - not valid' do
      l1 = Logic.create(num_a: 1011, num_b: 25)
      l2 = Logic.new(num_a: 1011, num_b: 25)
      expect(l2).not_to be_valid
    end
  end
end
