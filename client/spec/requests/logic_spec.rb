require 'rails_helper'
require 'faker'

RSpec.describe "Logics", type: :request do
  # Тестируем корневой маршрут
  describe 'GET /' do
    before { get root_path } # перед каждым тестом делать запрос

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
  # тестируем итоговый маршрут
  describe 'GET /result' do
    # Сценарий, когда параметры неправильные
    context 'when params are blank' do
      before {  post '/logic/result' } # перед каждым тестом делать запрос

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with plain text' do # default xslt: '0'
        expect(response.content_type).to match("text/plain; charset=utf-8")
      end

    end

    # Сценарий, когда парамаетры правильные
    context 'when params are ok' do
      # создаем случайные значения
      let(:a) { Faker::Number.number(digits: 3) }
      let(:b) { Faker::Number.number(digits: 3) }

      # перед каждым тестом делать запрос (params - параметры запроса)
      before { post '/logic/result', params: { number_a: a, number_b: b, xslt: '1', convert_type: 'client' } }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'responds with xml' do
        expect(response.content_type).to match("application/xml; charset=utf-8")
      end
    end

    it 'should post different requests' do
      # делаем 2 запроса с разными параметрами
      post '/logic/result', params: { number_a: Faker::Number.number(digits: 3),
                                      number_b: Faker::Number.number(digits: 3),
                                      xslt: '1', convert_type: 'client' }
      req1 = response.body
      post '/logic/result', params: { number_a: Faker::Number.number(digits: 3),
                                      number_b: Faker::Number.number(digits: 3),
                                      xslt: '1', convert_type: 'client' }
      req2 = response.body
      expect(req1).not_to eq(req2)
    end
  end
end
