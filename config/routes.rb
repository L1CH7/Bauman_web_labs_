Rails.application.routes.draw do
  get 'user_list/all'
  get 'user_list/you'
  get 'calc/input'
  get 'calc/view'
  devise_for :users
  root to: 'calc#input'
end
