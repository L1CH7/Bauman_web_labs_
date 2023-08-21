# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'logics#index'
  resources :logics, only: %i[index new create destroy]
  get 'logics/result'
end
