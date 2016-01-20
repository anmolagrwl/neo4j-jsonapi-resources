Peeps::Application.routes.draw do
  jsonapi_resources :contacts
  jsonapi_resources :phone_numbers
  # commented the above as route couldn't be found after running the server
  # resources :phone_numbers
end
