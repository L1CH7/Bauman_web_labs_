# frozen_string_literal: true

require 'rails_helper'

# функциональный тест, проверяющий, что результаты вычислений различны при различных входных параметрах.
RSpec.describe 'Logics', type: :request do
  describe 'GET /logics' do
    it 'should get status 200 in response' do
      get logics_path
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST /logics' do
    it 'should insert 2 different rows' do
      post logics_path, params: { logic: { num_a: 1000, num_b: 255 } }
      post logics_path, params: { logic: { num_a: 1011, num_b: 252 } }
      expect(response).to be_redirect
      expect(Logic.count).to eq(2)
    end
  end
  describe 'DELETE /logics/id' do
    it 'should not add any row' do
      l = Logic.create(num_a: 1011, num_b: 252)
      delete "/logics/#{l.id}"
      expect(Logic.count).to eq(0)
      expect(response).to be_redirect
    end
  end
end
