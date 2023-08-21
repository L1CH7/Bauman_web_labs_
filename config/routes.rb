# frozen_string_literal: true

Rails.application.routes.draw do
  root 'logic#input'
  get 'logic/view'
end
