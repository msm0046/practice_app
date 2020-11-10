Rails.application.routes.draw do
  get 'list_of_names/index'
  # get '/'
  get 'fifty_character_table/index'
  root 'fifty_character_table#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
