# frozen_string_literal: true

Rails.application.routes.draw do
  root 'logic#input'
  get 'logic/view.xml', to: 'logic#view', format: 'xml'
  get 'logic/view', to: redirect('/logic/view.xml')
  get '/', to: redirect('/logic/view')
end
