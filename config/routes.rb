Rails.application.routes.draw do
  get 'admin/attendance_confirmation', to: 'attendance_confirmation#index'
  get 'admin/attendance_confirmation/index', to: 'attendance_confirmation#index'
  get 'list_of_names/index'
  get 'list_of_names/show'
  # get '/'
  get 'fifty_character_table/index'
  root 'fifty_character_table#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
