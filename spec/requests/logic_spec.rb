# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logic', type: :request do
  describe 'GET /logic' do
    it 'should get status 200 - succsess' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /logic' do
    it 'should get right results' do
      get '/logic/view', params: { number_a: 15, number_b: 21 }
      expect(response).to have_http_status(200)
      expect(assigns(:result)).to eq({ nod: 3, nok: 105 })
    end
  end
end
