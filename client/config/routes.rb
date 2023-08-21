Rails.application.routes.draw do
  root 'logic#viewer'
  get 'logic/viewer'
  post 'logic/result'
  get 'logic/get_xml_remotely'
end
