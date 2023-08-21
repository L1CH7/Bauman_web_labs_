# frozen_string_literal: true

Rails.application.routes.draw do
  root 'logic#input'
  post '/result', to: 'logic#result'
end
